import 'package:drift/drift.dart';

/// ═══════════════════════════════════════════════════════════════
/// MEDIA FILES — one row per file the user has interacted with.
/// We do NOT store the file itself — only metadata + user flags.
/// `id` is the file path (unique, stable across sessions).
/// ═══════════════════════════════════════════════════════════════
class MediaFiles extends Table {
  TextColumn get id => text()();                       // file path
  TextColumn get assetId => text().nullable()();       // photo_manager id
  TextColumn get fileName => text()();                 // display name
  TextColumn get filePath => text()();                 // real path
  IntColumn get mediaType => integer()();              // 0=img,1=vid,2=other
  IntColumn get sizeBytes => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  BoolColumn get isSaved => boolean().withDefault(const Constant(false))();
  DateTimeColumn get deletedAt => dateTime().nullable()(); // null = not trashed
  DateTimeColumn get lastModified => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// ═══════════════════════════════════════════════════════════════
/// ALBUMS — user-created collections.
/// ═══════════════════════════════════════════════════════════════
class Albums extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get coverFileId => text().nullable()();   // cover image path
  DateTimeColumn get createdAt => dateTime()();
}

/// ═══════════════════════════════════════════════════════════════
/// ALBUM FILES — many-to-many bridge between albums and files.
/// A file can be in multiple albums; an album has many files.
/// ═══════════════════════════════════════════════════════════════
class AlbumFiles extends Table {
  IntColumn get albumId =>
      integer().references(Albums, #id, onDelete: KeyAction.cascade)();
  TextColumn get fileId =>
      text().references(MediaFiles, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {albumId, fileId};
}
