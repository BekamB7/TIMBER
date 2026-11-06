import 'package:drift/drift.dart' hide Column;
import 'package:photo_manager/photo_manager.dart';

import '../../../data/local/database.dart';

/// ═══════════════════════════════════════════════════════════════
/// Result of a scan — what was found and how many.
/// ═══════════════════════════════════════════════════════════════
class ScanResult {
  const ScanResult({
    required this.images,
    required this.videos,
    required this.other,
    required this.totalBytes,
    required this.duration,
  });

  final int images;
  final int videos;
  final int other;
  final int totalBytes;
  final Duration duration;

  int get total => images + videos + other;

  @override
  String toString() =>
      'ScanResult(images: $images, videos: $videos, other: $other, '
      'total: $total, ${(totalBytes / 1024 / 1024).toStringAsFixed(1)} MB, '
      '${duration.inSeconds}s)';
}

/// ═══════════════════════════════════════════════════════════════
/// MediaScannerService — talks to photo_manager, upserts into DB.
/// ═══════════════════════════════════════════════════════════════
class MediaScannerService {
  MediaScannerService(this._db);

  final AppDatabase _db;

Future<bool> requestPermission() async {
  final permission = await PhotoManager.requestPermissionExtend(
    requestOption: const PermissionRequestOption(
      androidPermission: AndroidPermission(
        type: RequestType.common,
        mediaLocation: false,
      ),
    ),
  );
  return permission.isAuth || permission.hasAccess;
}

  /// Full scan — reads every photo & video on the device,
  /// converts to DB rows, batch-upserts them.
  Future<ScanResult> scanAll({
    void Function(int processed, int total)? onProgress,
  }) async {
    final stopwatch = Stopwatch()..start();

    // 1. Get all albums/folders (Camera, Screenshots, WhatsApp, etc.)
    final folders = await PhotoManager.getAssetPathList(
      type: RequestType.common,
      onlyAll: false,
    );

    if (folders.isEmpty) {
      stopwatch.stop();
      return ScanResult(
        images: 0,
        videos: 0,
        other: 0,
        totalBytes: 0,
        duration: stopwatch.elapsed,
      );
    }

    // 2. Count total assets first (for progress)
    int totalAssets = 0;
    for (final folder in folders) {
      totalAssets += await folder.assetCountAsync;
    }

    // 3. Collect all assets across all folders
    final Map<String, MediaFilesCompanion> uniqueRows = {};
    int processed = 0;
    int imageCount = 0;
    int videoCount = 0;
    int otherCount = 0;
    int totalBytes = 0;

    for (final folder in folders) {
      final count = await folder.assetCountAsync;
      const pageSize = 200;
      int page = 0;

      while (page * pageSize < count) {
        final assets = await folder.getAssetListPaged(
          page: page,
          size: pageSize,
        );
        if (assets.isEmpty) break;

        for (final asset in assets) {
          final file = await asset.file;
          final path = file?.path ?? '';

          if (path.isEmpty) {
            processed++;
            continue;
          }

          // Deduplicate by path (photo_manager may return same asset twice)
          if (uniqueRows.containsKey(path)) {
            processed++;
            continue;
          }

          final mediaType = _mediaTypeFor(asset.type);

          // Get byte size from file on disk (asset.size is dimensions!)
          int fileBytes = 0;
          try {
            fileBytes = await file!.length();
          } catch (_) {
            fileBytes = 0;
          }

          uniqueRows[path] = MediaFilesCompanion.insert(
            id: path,
            assetId: Value(asset.id),
            fileName: asset.title ?? _filenameFromPath(path),
            filePath: path,
            mediaType: mediaType,
            sizeBytes: Value(fileBytes),
            createdAt: asset.createDateTime,
            lastModified: asset.modifiedDateTime,
          );

          totalBytes += fileBytes;
          if (mediaType == 0) {
            imageCount++;
          } else if (mediaType == 1) {
            videoCount++;
          } else {
            otherCount++;
          }

          processed++;
          onProgress?.call(processed, totalAssets);
        }
        page++;
      }
    }

    // 4. Batch upsert everything into DB
    if (uniqueRows.isNotEmpty) {
      await _db.upsertFiles(uniqueRows.values.toList());
    }

    stopwatch.stop();

    // 5. Auto-purge old trash items
    await _db.purgeOldTrash();

    return ScanResult(
      images: imageCount,
      videos: videoCount,
      other: otherCount,
      totalBytes: totalBytes,
      duration: stopwatch.elapsed,
    );
  }

  /// Map photo_manager's AssetType to our ints (0=image, 1=video, 2=other).
  int _mediaTypeFor(AssetType type) {
    switch (type) {
      case AssetType.image:
        return 0;
      case AssetType.video:
        return 1;
      case AssetType.audio:
      case AssetType.other:
        return 2;
    }
  }

  /// Fallback filename from path if asset.title is null.
  String _filenameFromPath(String path) {
    final parts = path.split('/');
    return parts.isNotEmpty ? parts.last : path;
  }
}
