import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/database_provider.dart';

/// ═══════════════════════════════════════════════════════════════
/// A snapshot of counts and sizes for the Dashboard.
/// ═══════════════════════════════════════════════════════════════
class DashboardStats {
  const DashboardStats({
    required this.imagesCount,
    required this.videosCount,
    required this.downloadsCount,
    required this.screenshotsCount,
    required this.favoritesCount,
    required this.trashCount,
    required this.savedCount,
    required this.totalBytes,
    required this.trashedBytes,
  });

  final int imagesCount;
  final int videosCount;
  final int downloadsCount;
  final int screenshotsCount;
  final int favoritesCount;
  final int trashCount;
  final int savedCount;
  final int totalBytes;
  final int trashedBytes;

  int get totalCount =>
      imagesCount + videosCount + downloadsCount + screenshotsCount;

  static const empty = DashboardStats(
    imagesCount: 0,
    videosCount: 0,
    downloadsCount: 0,
    screenshotsCount: 0,
    favoritesCount: 0,
    trashCount: 0,
    savedCount: 0,
    totalBytes: 0,
    trashedBytes: 0,
  );
}

/// ═══════════════════════════════════════════════════════════════
/// Streams live stats from the DB. Rebuilds UI on any DB change.
/// ═══════════════════════════════════════════════════════════════
final dashboardStatsProvider = StreamProvider<DashboardStats>((ref) {
  final db = ref.watch(databaseProvider);

  final activeQuery = db.select(db.mediaFiles)
    ..where((t) => t.deletedAt.isNull());

  return activeQuery.watch().map((rows) {
    int images = 0;
    int videos = 0;
    int downloads = 0;
    int screenshots = 0;
    int totalBytes = 0;
    int favorites = 0;
    int saved = 0;

    for (final row in rows) {
      totalBytes += row.sizeBytes;

      if (row.isFavorite) favorites++;
      if (row.isSaved) saved++;

      final path = row.filePath.toLowerCase();
      final name = row.fileName.toLowerCase();

      if (row.mediaType == 1) {
        videos++;
      } else if (row.mediaType == 0) {
        if (_isScreenshot(path, name)) {
          screenshots++;
        } else if (_isDownload(path, name)) {
          downloads++;
        } else {
          images++;
        }
      }
    }

    return DashboardStats(
      imagesCount: images,
      videosCount: videos,
      downloadsCount: downloads,
      screenshotsCount: screenshots,
      favoritesCount: favorites,
      trashCount: 0,
      savedCount: saved,
      totalBytes: totalBytes,
      trashedBytes: 0,
    );
  });
});

/// Helper: heuristic to detect screenshots from path/name.
bool _isScreenshot(String path, String name) {
  return path.contains('/screenshots/') ||
      path.contains('/screenshot/') ||
      name.contains('screenshot') ||
      name.startsWith('screenshot_') ||
      name.startsWith('screen_shot');
}

/// Helper: detect downloads.
bool _isDownload(String path, String name) {
  return path.contains('/download/') ||
      path.contains('/downloads/') ||
      path.contains('/telegram/') ||
      path.contains('/whatsapp/');
}

/// ═══════════════════════════════════════════════════════════════
/// Separate provider for trash stats (needs different filter).
/// ═══════════════════════════════════════════════════════════════
final trashStatsProvider = StreamProvider<({int count, int bytes})>((ref) {
  final db = ref.watch(databaseProvider);

  final trashQuery = db.select(db.mediaFiles)
    ..where((t) => t.deletedAt.isNotNull());

  return trashQuery.watch().map((rows) {
    int bytes = 0;
    for (final row in rows) {
      bytes += row.sizeBytes;
    }
    return (count: rows.length, bytes: bytes);
  });
});
