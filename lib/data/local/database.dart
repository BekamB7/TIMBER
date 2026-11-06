import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables.dart';

part 'database.g.dart';

/// ═══════════════════════════════════════════════════════════════
/// The Timber database — holds favorites, albums, trash flags.
/// Generated DAOs live in database.g.dart (do not edit).
/// ═══════════════════════════════════════════════════════════════
@DriftDatabase(tables: [MediaFiles, Albums, AlbumFiles])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // ─────────────────────────── MEDIA QUERIES ───────────────────────────

  /// All files that aren't in trash.
  Future<List<MediaFile>> getAllActiveFiles() {
    return (select(mediaFiles)
          ..where((t) => t.deletedAt.isNull())
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();
  }

  /// Favorite files only.
  Future<List<MediaFile>> getFavoriteFiles() {
    return (select(mediaFiles)
          ..where((t) => t.isFavorite.equals(true) & t.deletedAt.isNull()))
        .get();
  }

  /// Files in trash, newest deleted first.
  Future<List<MediaFile>> getTrashedFiles() {
    return (select(mediaFiles)
          ..where((t) => t.deletedAt.isNotNull())
          ..orderBy([(t) => OrderingTerm.desc(t.deletedAt)]))
        .get();
  }

  /// Insert or update a file (upsert by id/path).
  Future<void> upsertFile(MediaFilesCompanion file) {
    return into(mediaFiles).insertOnConflictUpdate(file);
  }

  /// Batch upsert — much faster for large imports.
  Future<void> upsertFiles(List<MediaFilesCompanion> files) async {
    await batch((b) => b.insertAllOnConflictUpdate(mediaFiles, files));
  }

  /// Toggle favorite flag.
  Future<void> toggleFavorite(String fileId) async {
    final row = await (select(mediaFiles)
          ..where((t) => t.id.equals(fileId)))
        .getSingleOrNull();
    if (row == null) return;
    await (update(mediaFiles)..where((t) => t.id.equals(fileId))).write(
      MediaFilesCompanion(isFavorite: Value(!row.isFavorite)),
    );
  }

  /// Toggle saved flag ("Important").
  Future<void> toggleSaved(String fileId) async {
    final row = await (select(mediaFiles)
          ..where((t) => t.id.equals(fileId)))
        .getSingleOrNull();
    if (row == null) return;
    await (update(mediaFiles)..where((t) => t.id.equals(fileId))).write(
      MediaFilesCompanion(isSaved: Value(!row.isSaved)),
    );
  }

  /// Move file to trash.
  Future<void> moveToTrash(String fileId) {
    return (update(mediaFiles)..where((t) => t.id.equals(fileId))).write(
      MediaFilesCompanion(deletedAt: Value(DateTime.now())),
    );
  }

  /// Restore from trash.
  Future<void> restoreFromTrash(String fileId) {
    return (update(mediaFiles)..where((t) => t.id.equals(fileId))).write(
      const MediaFilesCompanion(deletedAt: Value(null)),
    );
  }

  /// Permanently delete from DB (file on disk is separate).
  Future<void> hardDelete(String fileId) {
    return (delete(mediaFiles)..where((t) => t.id.equals(fileId))).go();
  }

  /// Empty trash — deletes all rows with deletedAt set.
  Future<void> emptyTrash() {
    return (delete(mediaFiles)..where((t) => t.deletedAt.isNotNull())).go();
  }

  // ─────────────────────────── ALBUM QUERIES ───────────────────────────

  Future<int> createAlbum(String name, {String? coverFileId}) {
    return into(albums).insert(
      AlbumsCompanion.insert(
        name: name,
        coverFileId: Value(coverFileId),
        createdAt: DateTime.now(),
      ),
    );
  }

  Future<List<Album>> getAllAlbums() {
    return (select(albums)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();
  }

  Future<void> addFileToAlbum(int albumId, String fileId) {
    return into(albumFiles).insert(
      AlbumFilesCompanion.insert(albumId: albumId, fileId: fileId),
      mode: InsertMode.insertOrIgnore,
    );
  }

  Future<void> removeFileFromAlbum(int albumId, String fileId) {
    return (delete(albumFiles)
          ..where((t) =>
              t.albumId.equals(albumId) & t.fileId.equals(fileId)))
        .go();
  }

  Future<List<MediaFile>> getFilesInAlbum(int albumId) async {
    final query = select(mediaFiles).join([
      innerJoin(albumFiles, albumFiles.fileId.equalsExp(mediaFiles.id)),
    ])
      ..where(albumFiles.albumId.equals(albumId));

    final rows = await query.get();
    return rows.map((r) => r.readTable(mediaFiles)).toList();
  }

  /// Auto-purge trash older than 30 days.
  Future<int> purgeOldTrash({int days = 30}) {
    final cutoff = DateTime.now().subtract(Duration(days: days));
    return (delete(mediaFiles)
          ..where((t) =>
              t.deletedAt.isNotNull() & t.deletedAt.isSmallerThanValue(cutoff)))
        .go();
  }
}

/// Opens the SQLite file in the app's documents directory.
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'timber.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
