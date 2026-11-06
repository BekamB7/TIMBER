// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MediaFilesTable extends MediaFiles
    with TableInfo<$MediaFilesTable, MediaFile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaFilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _assetIdMeta =
      const VerificationMeta('assetId');
  @override
  late final GeneratedColumn<String> assetId = GeneratedColumn<String>(
      'asset_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fileNameMeta =
      const VerificationMeta('fileName');
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
      'file_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaTypeMeta =
      const VerificationMeta('mediaType');
  @override
  late final GeneratedColumn<int> mediaType = GeneratedColumn<int>(
      'media_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sizeBytesMeta =
      const VerificationMeta('sizeBytes');
  @override
  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
      'size_bytes', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isFavoriteMeta =
      const VerificationMeta('isFavorite');
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
      'is_favorite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_favorite" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isSavedMeta =
      const VerificationMeta('isSaved');
  @override
  late final GeneratedColumn<bool> isSaved = GeneratedColumn<bool>(
      'is_saved', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_saved" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastModifiedMeta =
      const VerificationMeta('lastModified');
  @override
  late final GeneratedColumn<DateTime> lastModified = GeneratedColumn<DateTime>(
      'last_modified', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        assetId,
        fileName,
        filePath,
        mediaType,
        sizeBytes,
        createdAt,
        isFavorite,
        isSaved,
        deletedAt,
        lastModified
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_files';
  @override
  VerificationContext validateIntegrity(Insertable<MediaFile> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('asset_id')) {
      context.handle(_assetIdMeta,
          assetId.isAcceptableOrUnknown(data['asset_id']!, _assetIdMeta));
    }
    if (data.containsKey('file_name')) {
      context.handle(_fileNameMeta,
          fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta));
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('media_type')) {
      context.handle(_mediaTypeMeta,
          mediaType.isAcceptableOrUnknown(data['media_type']!, _mediaTypeMeta));
    } else if (isInserting) {
      context.missing(_mediaTypeMeta);
    }
    if (data.containsKey('size_bytes')) {
      context.handle(_sizeBytesMeta,
          sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite']!, _isFavoriteMeta));
    }
    if (data.containsKey('is_saved')) {
      context.handle(_isSavedMeta,
          isSaved.isAcceptableOrUnknown(data['is_saved']!, _isSavedMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('last_modified')) {
      context.handle(
          _lastModifiedMeta,
          lastModified.isAcceptableOrUnknown(
              data['last_modified']!, _lastModifiedMeta));
    } else if (isInserting) {
      context.missing(_lastModifiedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MediaFile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaFile(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      assetId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}asset_id']),
      fileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_name'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path'])!,
      mediaType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}media_type'])!,
      sizeBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}size_bytes'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      isFavorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favorite'])!,
      isSaved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_saved'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      lastModified: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_modified'])!,
    );
  }

  @override
  $MediaFilesTable createAlias(String alias) {
    return $MediaFilesTable(attachedDatabase, alias);
  }
}

class MediaFile extends DataClass implements Insertable<MediaFile> {
  final String id;
  final String? assetId;
  final String fileName;
  final String filePath;
  final int mediaType;
  final int sizeBytes;
  final DateTime createdAt;
  final bool isFavorite;
  final bool isSaved;
  final DateTime? deletedAt;
  final DateTime lastModified;
  const MediaFile(
      {required this.id,
      this.assetId,
      required this.fileName,
      required this.filePath,
      required this.mediaType,
      required this.sizeBytes,
      required this.createdAt,
      required this.isFavorite,
      required this.isSaved,
      this.deletedAt,
      required this.lastModified});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || assetId != null) {
      map['asset_id'] = Variable<String>(assetId);
    }
    map['file_name'] = Variable<String>(fileName);
    map['file_path'] = Variable<String>(filePath);
    map['media_type'] = Variable<int>(mediaType);
    map['size_bytes'] = Variable<int>(sizeBytes);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['is_saved'] = Variable<bool>(isSaved);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['last_modified'] = Variable<DateTime>(lastModified);
    return map;
  }

  MediaFilesCompanion toCompanion(bool nullToAbsent) {
    return MediaFilesCompanion(
      id: Value(id),
      assetId: assetId == null && nullToAbsent
          ? const Value.absent()
          : Value(assetId),
      fileName: Value(fileName),
      filePath: Value(filePath),
      mediaType: Value(mediaType),
      sizeBytes: Value(sizeBytes),
      createdAt: Value(createdAt),
      isFavorite: Value(isFavorite),
      isSaved: Value(isSaved),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      lastModified: Value(lastModified),
    );
  }

  factory MediaFile.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaFile(
      id: serializer.fromJson<String>(json['id']),
      assetId: serializer.fromJson<String?>(json['assetId']),
      fileName: serializer.fromJson<String>(json['fileName']),
      filePath: serializer.fromJson<String>(json['filePath']),
      mediaType: serializer.fromJson<int>(json['mediaType']),
      sizeBytes: serializer.fromJson<int>(json['sizeBytes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      isSaved: serializer.fromJson<bool>(json['isSaved']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      lastModified: serializer.fromJson<DateTime>(json['lastModified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'assetId': serializer.toJson<String?>(assetId),
      'fileName': serializer.toJson<String>(fileName),
      'filePath': serializer.toJson<String>(filePath),
      'mediaType': serializer.toJson<int>(mediaType),
      'sizeBytes': serializer.toJson<int>(sizeBytes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'isSaved': serializer.toJson<bool>(isSaved),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'lastModified': serializer.toJson<DateTime>(lastModified),
    };
  }

  MediaFile copyWith(
          {String? id,
          Value<String?> assetId = const Value.absent(),
          String? fileName,
          String? filePath,
          int? mediaType,
          int? sizeBytes,
          DateTime? createdAt,
          bool? isFavorite,
          bool? isSaved,
          Value<DateTime?> deletedAt = const Value.absent(),
          DateTime? lastModified}) =>
      MediaFile(
        id: id ?? this.id,
        assetId: assetId.present ? assetId.value : this.assetId,
        fileName: fileName ?? this.fileName,
        filePath: filePath ?? this.filePath,
        mediaType: mediaType ?? this.mediaType,
        sizeBytes: sizeBytes ?? this.sizeBytes,
        createdAt: createdAt ?? this.createdAt,
        isFavorite: isFavorite ?? this.isFavorite,
        isSaved: isSaved ?? this.isSaved,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        lastModified: lastModified ?? this.lastModified,
      );
  MediaFile copyWithCompanion(MediaFilesCompanion data) {
    return MediaFile(
      id: data.id.present ? data.id.value : this.id,
      assetId: data.assetId.present ? data.assetId.value : this.assetId,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      mediaType: data.mediaType.present ? data.mediaType.value : this.mediaType,
      sizeBytes: data.sizeBytes.present ? data.sizeBytes.value : this.sizeBytes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isFavorite:
          data.isFavorite.present ? data.isFavorite.value : this.isFavorite,
      isSaved: data.isSaved.present ? data.isSaved.value : this.isSaved,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      lastModified: data.lastModified.present
          ? data.lastModified.value
          : this.lastModified,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaFile(')
          ..write('id: $id, ')
          ..write('assetId: $assetId, ')
          ..write('fileName: $fileName, ')
          ..write('filePath: $filePath, ')
          ..write('mediaType: $mediaType, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('createdAt: $createdAt, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('isSaved: $isSaved, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('lastModified: $lastModified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, assetId, fileName, filePath, mediaType,
      sizeBytes, createdAt, isFavorite, isSaved, deletedAt, lastModified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaFile &&
          other.id == this.id &&
          other.assetId == this.assetId &&
          other.fileName == this.fileName &&
          other.filePath == this.filePath &&
          other.mediaType == this.mediaType &&
          other.sizeBytes == this.sizeBytes &&
          other.createdAt == this.createdAt &&
          other.isFavorite == this.isFavorite &&
          other.isSaved == this.isSaved &&
          other.deletedAt == this.deletedAt &&
          other.lastModified == this.lastModified);
}

class MediaFilesCompanion extends UpdateCompanion<MediaFile> {
  final Value<String> id;
  final Value<String?> assetId;
  final Value<String> fileName;
  final Value<String> filePath;
  final Value<int> mediaType;
  final Value<int> sizeBytes;
  final Value<DateTime> createdAt;
  final Value<bool> isFavorite;
  final Value<bool> isSaved;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> lastModified;
  final Value<int> rowid;
  const MediaFilesCompanion({
    this.id = const Value.absent(),
    this.assetId = const Value.absent(),
    this.fileName = const Value.absent(),
    this.filePath = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.isSaved = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.lastModified = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaFilesCompanion.insert({
    required String id,
    this.assetId = const Value.absent(),
    required String fileName,
    required String filePath,
    required int mediaType,
    this.sizeBytes = const Value.absent(),
    required DateTime createdAt,
    this.isFavorite = const Value.absent(),
    this.isSaved = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime lastModified,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        fileName = Value(fileName),
        filePath = Value(filePath),
        mediaType = Value(mediaType),
        createdAt = Value(createdAt),
        lastModified = Value(lastModified);
  static Insertable<MediaFile> custom({
    Expression<String>? id,
    Expression<String>? assetId,
    Expression<String>? fileName,
    Expression<String>? filePath,
    Expression<int>? mediaType,
    Expression<int>? sizeBytes,
    Expression<DateTime>? createdAt,
    Expression<bool>? isFavorite,
    Expression<bool>? isSaved,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? lastModified,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assetId != null) 'asset_id': assetId,
      if (fileName != null) 'file_name': fileName,
      if (filePath != null) 'file_path': filePath,
      if (mediaType != null) 'media_type': mediaType,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
      if (createdAt != null) 'created_at': createdAt,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (isSaved != null) 'is_saved': isSaved,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (lastModified != null) 'last_modified': lastModified,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaFilesCompanion copyWith(
      {Value<String>? id,
      Value<String?>? assetId,
      Value<String>? fileName,
      Value<String>? filePath,
      Value<int>? mediaType,
      Value<int>? sizeBytes,
      Value<DateTime>? createdAt,
      Value<bool>? isFavorite,
      Value<bool>? isSaved,
      Value<DateTime?>? deletedAt,
      Value<DateTime>? lastModified,
      Value<int>? rowid}) {
    return MediaFilesCompanion(
      id: id ?? this.id,
      assetId: assetId ?? this.assetId,
      fileName: fileName ?? this.fileName,
      filePath: filePath ?? this.filePath,
      mediaType: mediaType ?? this.mediaType,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      createdAt: createdAt ?? this.createdAt,
      isFavorite: isFavorite ?? this.isFavorite,
      isSaved: isSaved ?? this.isSaved,
      deletedAt: deletedAt ?? this.deletedAt,
      lastModified: lastModified ?? this.lastModified,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (assetId.present) {
      map['asset_id'] = Variable<String>(assetId.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<int>(mediaType.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (isSaved.present) {
      map['is_saved'] = Variable<bool>(isSaved.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (lastModified.present) {
      map['last_modified'] = Variable<DateTime>(lastModified.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaFilesCompanion(')
          ..write('id: $id, ')
          ..write('assetId: $assetId, ')
          ..write('fileName: $fileName, ')
          ..write('filePath: $filePath, ')
          ..write('mediaType: $mediaType, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('createdAt: $createdAt, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('isSaved: $isSaved, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('lastModified: $lastModified, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AlbumsTable extends Albums with TableInfo<$AlbumsTable, Album> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlbumsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _coverFileIdMeta =
      const VerificationMeta('coverFileId');
  @override
  late final GeneratedColumn<String> coverFileId = GeneratedColumn<String>(
      'cover_file_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, coverFileId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'albums';
  @override
  VerificationContext validateIntegrity(Insertable<Album> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('cover_file_id')) {
      context.handle(
          _coverFileIdMeta,
          coverFileId.isAcceptableOrUnknown(
              data['cover_file_id']!, _coverFileIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Album map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Album(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      coverFileId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cover_file_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $AlbumsTable createAlias(String alias) {
    return $AlbumsTable(attachedDatabase, alias);
  }
}

class Album extends DataClass implements Insertable<Album> {
  final int id;
  final String name;
  final String? coverFileId;
  final DateTime createdAt;
  const Album(
      {required this.id,
      required this.name,
      this.coverFileId,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || coverFileId != null) {
      map['cover_file_id'] = Variable<String>(coverFileId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AlbumsCompanion toCompanion(bool nullToAbsent) {
    return AlbumsCompanion(
      id: Value(id),
      name: Value(name),
      coverFileId: coverFileId == null && nullToAbsent
          ? const Value.absent()
          : Value(coverFileId),
      createdAt: Value(createdAt),
    );
  }

  factory Album.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Album(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      coverFileId: serializer.fromJson<String?>(json['coverFileId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'coverFileId': serializer.toJson<String?>(coverFileId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Album copyWith(
          {int? id,
          String? name,
          Value<String?> coverFileId = const Value.absent(),
          DateTime? createdAt}) =>
      Album(
        id: id ?? this.id,
        name: name ?? this.name,
        coverFileId: coverFileId.present ? coverFileId.value : this.coverFileId,
        createdAt: createdAt ?? this.createdAt,
      );
  Album copyWithCompanion(AlbumsCompanion data) {
    return Album(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      coverFileId:
          data.coverFileId.present ? data.coverFileId.value : this.coverFileId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Album(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('coverFileId: $coverFileId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, coverFileId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Album &&
          other.id == this.id &&
          other.name == this.name &&
          other.coverFileId == this.coverFileId &&
          other.createdAt == this.createdAt);
}

class AlbumsCompanion extends UpdateCompanion<Album> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> coverFileId;
  final Value<DateTime> createdAt;
  const AlbumsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.coverFileId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AlbumsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.coverFileId = const Value.absent(),
    required DateTime createdAt,
  })  : name = Value(name),
        createdAt = Value(createdAt);
  static Insertable<Album> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? coverFileId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (coverFileId != null) 'cover_file_id': coverFileId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AlbumsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? coverFileId,
      Value<DateTime>? createdAt}) {
    return AlbumsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      coverFileId: coverFileId ?? this.coverFileId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (coverFileId.present) {
      map['cover_file_id'] = Variable<String>(coverFileId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlbumsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('coverFileId: $coverFileId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AlbumFilesTable extends AlbumFiles
    with TableInfo<$AlbumFilesTable, AlbumFile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AlbumFilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _albumIdMeta =
      const VerificationMeta('albumId');
  @override
  late final GeneratedColumn<int> albumId = GeneratedColumn<int>(
      'album_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES albums (id) ON DELETE CASCADE'));
  static const VerificationMeta _fileIdMeta = const VerificationMeta('fileId');
  @override
  late final GeneratedColumn<String> fileId = GeneratedColumn<String>(
      'file_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES media_files (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [albumId, fileId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'album_files';
  @override
  VerificationContext validateIntegrity(Insertable<AlbumFile> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('album_id')) {
      context.handle(_albumIdMeta,
          albumId.isAcceptableOrUnknown(data['album_id']!, _albumIdMeta));
    } else if (isInserting) {
      context.missing(_albumIdMeta);
    }
    if (data.containsKey('file_id')) {
      context.handle(_fileIdMeta,
          fileId.isAcceptableOrUnknown(data['file_id']!, _fileIdMeta));
    } else if (isInserting) {
      context.missing(_fileIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {albumId, fileId};
  @override
  AlbumFile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AlbumFile(
      albumId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}album_id'])!,
      fileId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_id'])!,
    );
  }

  @override
  $AlbumFilesTable createAlias(String alias) {
    return $AlbumFilesTable(attachedDatabase, alias);
  }
}

class AlbumFile extends DataClass implements Insertable<AlbumFile> {
  final int albumId;
  final String fileId;
  const AlbumFile({required this.albumId, required this.fileId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['album_id'] = Variable<int>(albumId);
    map['file_id'] = Variable<String>(fileId);
    return map;
  }

  AlbumFilesCompanion toCompanion(bool nullToAbsent) {
    return AlbumFilesCompanion(
      albumId: Value(albumId),
      fileId: Value(fileId),
    );
  }

  factory AlbumFile.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AlbumFile(
      albumId: serializer.fromJson<int>(json['albumId']),
      fileId: serializer.fromJson<String>(json['fileId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'albumId': serializer.toJson<int>(albumId),
      'fileId': serializer.toJson<String>(fileId),
    };
  }

  AlbumFile copyWith({int? albumId, String? fileId}) => AlbumFile(
        albumId: albumId ?? this.albumId,
        fileId: fileId ?? this.fileId,
      );
  AlbumFile copyWithCompanion(AlbumFilesCompanion data) {
    return AlbumFile(
      albumId: data.albumId.present ? data.albumId.value : this.albumId,
      fileId: data.fileId.present ? data.fileId.value : this.fileId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AlbumFile(')
          ..write('albumId: $albumId, ')
          ..write('fileId: $fileId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(albumId, fileId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AlbumFile &&
          other.albumId == this.albumId &&
          other.fileId == this.fileId);
}

class AlbumFilesCompanion extends UpdateCompanion<AlbumFile> {
  final Value<int> albumId;
  final Value<String> fileId;
  final Value<int> rowid;
  const AlbumFilesCompanion({
    this.albumId = const Value.absent(),
    this.fileId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AlbumFilesCompanion.insert({
    required int albumId,
    required String fileId,
    this.rowid = const Value.absent(),
  })  : albumId = Value(albumId),
        fileId = Value(fileId);
  static Insertable<AlbumFile> custom({
    Expression<int>? albumId,
    Expression<String>? fileId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (albumId != null) 'album_id': albumId,
      if (fileId != null) 'file_id': fileId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AlbumFilesCompanion copyWith(
      {Value<int>? albumId, Value<String>? fileId, Value<int>? rowid}) {
    return AlbumFilesCompanion(
      albumId: albumId ?? this.albumId,
      fileId: fileId ?? this.fileId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (albumId.present) {
      map['album_id'] = Variable<int>(albumId.value);
    }
    if (fileId.present) {
      map['file_id'] = Variable<String>(fileId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlbumFilesCompanion(')
          ..write('albumId: $albumId, ')
          ..write('fileId: $fileId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MediaFilesTable mediaFiles = $MediaFilesTable(this);
  late final $AlbumsTable albums = $AlbumsTable(this);
  late final $AlbumFilesTable albumFiles = $AlbumFilesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [mediaFiles, albums, albumFiles];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('albums',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('album_files', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('media_files',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('album_files', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$MediaFilesTableCreateCompanionBuilder = MediaFilesCompanion Function({
  required String id,
  Value<String?> assetId,
  required String fileName,
  required String filePath,
  required int mediaType,
  Value<int> sizeBytes,
  required DateTime createdAt,
  Value<bool> isFavorite,
  Value<bool> isSaved,
  Value<DateTime?> deletedAt,
  required DateTime lastModified,
  Value<int> rowid,
});
typedef $$MediaFilesTableUpdateCompanionBuilder = MediaFilesCompanion Function({
  Value<String> id,
  Value<String?> assetId,
  Value<String> fileName,
  Value<String> filePath,
  Value<int> mediaType,
  Value<int> sizeBytes,
  Value<DateTime> createdAt,
  Value<bool> isFavorite,
  Value<bool> isSaved,
  Value<DateTime?> deletedAt,
  Value<DateTime> lastModified,
  Value<int> rowid,
});

class $$MediaFilesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MediaFilesTable,
    MediaFile,
    $$MediaFilesTableFilterComposer,
    $$MediaFilesTableOrderingComposer,
    $$MediaFilesTableCreateCompanionBuilder,
    $$MediaFilesTableUpdateCompanionBuilder> {
  $$MediaFilesTableTableManager(_$AppDatabase db, $MediaFilesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MediaFilesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MediaFilesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> assetId = const Value.absent(),
            Value<String> fileName = const Value.absent(),
            Value<String> filePath = const Value.absent(),
            Value<int> mediaType = const Value.absent(),
            Value<int> sizeBytes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<bool> isFavorite = const Value.absent(),
            Value<bool> isSaved = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<DateTime> lastModified = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaFilesCompanion(
            id: id,
            assetId: assetId,
            fileName: fileName,
            filePath: filePath,
            mediaType: mediaType,
            sizeBytes: sizeBytes,
            createdAt: createdAt,
            isFavorite: isFavorite,
            isSaved: isSaved,
            deletedAt: deletedAt,
            lastModified: lastModified,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> assetId = const Value.absent(),
            required String fileName,
            required String filePath,
            required int mediaType,
            Value<int> sizeBytes = const Value.absent(),
            required DateTime createdAt,
            Value<bool> isFavorite = const Value.absent(),
            Value<bool> isSaved = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            required DateTime lastModified,
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaFilesCompanion.insert(
            id: id,
            assetId: assetId,
            fileName: fileName,
            filePath: filePath,
            mediaType: mediaType,
            sizeBytes: sizeBytes,
            createdAt: createdAt,
            isFavorite: isFavorite,
            isSaved: isSaved,
            deletedAt: deletedAt,
            lastModified: lastModified,
            rowid: rowid,
          ),
        ));
}

class $$MediaFilesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MediaFilesTable> {
  $$MediaFilesTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get assetId => $state.composableBuilder(
      column: $state.table.assetId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get fileName => $state.composableBuilder(
      column: $state.table.fileName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get filePath => $state.composableBuilder(
      column: $state.table.filePath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get mediaType => $state.composableBuilder(
      column: $state.table.mediaType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get sizeBytes => $state.composableBuilder(
      column: $state.table.sizeBytes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isFavorite => $state.composableBuilder(
      column: $state.table.isFavorite,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isSaved => $state.composableBuilder(
      column: $state.table.isSaved,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get deletedAt => $state.composableBuilder(
      column: $state.table.deletedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastModified => $state.composableBuilder(
      column: $state.table.lastModified,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter albumFilesRefs(
      ComposableFilter Function($$AlbumFilesTableFilterComposer f) f) {
    final $$AlbumFilesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.albumFiles,
        getReferencedColumn: (t) => t.fileId,
        builder: (joinBuilder, parentComposers) =>
            $$AlbumFilesTableFilterComposer(ComposerState($state.db,
                $state.db.albumFiles, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$MediaFilesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MediaFilesTable> {
  $$MediaFilesTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get assetId => $state.composableBuilder(
      column: $state.table.assetId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get fileName => $state.composableBuilder(
      column: $state.table.fileName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get filePath => $state.composableBuilder(
      column: $state.table.filePath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get mediaType => $state.composableBuilder(
      column: $state.table.mediaType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get sizeBytes => $state.composableBuilder(
      column: $state.table.sizeBytes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isFavorite => $state.composableBuilder(
      column: $state.table.isFavorite,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isSaved => $state.composableBuilder(
      column: $state.table.isSaved,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get deletedAt => $state.composableBuilder(
      column: $state.table.deletedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastModified => $state.composableBuilder(
      column: $state.table.lastModified,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$AlbumsTableCreateCompanionBuilder = AlbumsCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> coverFileId,
  required DateTime createdAt,
});
typedef $$AlbumsTableUpdateCompanionBuilder = AlbumsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> coverFileId,
  Value<DateTime> createdAt,
});

class $$AlbumsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AlbumsTable,
    Album,
    $$AlbumsTableFilterComposer,
    $$AlbumsTableOrderingComposer,
    $$AlbumsTableCreateCompanionBuilder,
    $$AlbumsTableUpdateCompanionBuilder> {
  $$AlbumsTableTableManager(_$AppDatabase db, $AlbumsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AlbumsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AlbumsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> coverFileId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              AlbumsCompanion(
            id: id,
            name: name,
            coverFileId: coverFileId,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> coverFileId = const Value.absent(),
            required DateTime createdAt,
          }) =>
              AlbumsCompanion.insert(
            id: id,
            name: name,
            coverFileId: coverFileId,
            createdAt: createdAt,
          ),
        ));
}

class $$AlbumsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AlbumsTable> {
  $$AlbumsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get coverFileId => $state.composableBuilder(
      column: $state.table.coverFileId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter albumFilesRefs(
      ComposableFilter Function($$AlbumFilesTableFilterComposer f) f) {
    final $$AlbumFilesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.albumFiles,
        getReferencedColumn: (t) => t.albumId,
        builder: (joinBuilder, parentComposers) =>
            $$AlbumFilesTableFilterComposer(ComposerState($state.db,
                $state.db.albumFiles, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$AlbumsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AlbumsTable> {
  $$AlbumsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get coverFileId => $state.composableBuilder(
      column: $state.table.coverFileId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$AlbumFilesTableCreateCompanionBuilder = AlbumFilesCompanion Function({
  required int albumId,
  required String fileId,
  Value<int> rowid,
});
typedef $$AlbumFilesTableUpdateCompanionBuilder = AlbumFilesCompanion Function({
  Value<int> albumId,
  Value<String> fileId,
  Value<int> rowid,
});

class $$AlbumFilesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AlbumFilesTable,
    AlbumFile,
    $$AlbumFilesTableFilterComposer,
    $$AlbumFilesTableOrderingComposer,
    $$AlbumFilesTableCreateCompanionBuilder,
    $$AlbumFilesTableUpdateCompanionBuilder> {
  $$AlbumFilesTableTableManager(_$AppDatabase db, $AlbumFilesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AlbumFilesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AlbumFilesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> albumId = const Value.absent(),
            Value<String> fileId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AlbumFilesCompanion(
            albumId: albumId,
            fileId: fileId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int albumId,
            required String fileId,
            Value<int> rowid = const Value.absent(),
          }) =>
              AlbumFilesCompanion.insert(
            albumId: albumId,
            fileId: fileId,
            rowid: rowid,
          ),
        ));
}

class $$AlbumFilesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AlbumFilesTable> {
  $$AlbumFilesTableFilterComposer(super.$state);
  $$AlbumsTableFilterComposer get albumId {
    final $$AlbumsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.albumId,
        referencedTable: $state.db.albums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$AlbumsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.albums, joinBuilder, parentComposers)));
    return composer;
  }

  $$MediaFilesTableFilterComposer get fileId {
    final $$MediaFilesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fileId,
        referencedTable: $state.db.mediaFiles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$MediaFilesTableFilterComposer(ComposerState($state.db,
                $state.db.mediaFiles, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$AlbumFilesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AlbumFilesTable> {
  $$AlbumFilesTableOrderingComposer(super.$state);
  $$AlbumsTableOrderingComposer get albumId {
    final $$AlbumsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.albumId,
        referencedTable: $state.db.albums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$AlbumsTableOrderingComposer(ComposerState(
                $state.db, $state.db.albums, joinBuilder, parentComposers)));
    return composer;
  }

  $$MediaFilesTableOrderingComposer get fileId {
    final $$MediaFilesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fileId,
        referencedTable: $state.db.mediaFiles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$MediaFilesTableOrderingComposer(ComposerState($state.db,
                $state.db.mediaFiles, joinBuilder, parentComposers)));
    return composer;
  }
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MediaFilesTableTableManager get mediaFiles =>
      $$MediaFilesTableTableManager(_db, _db.mediaFiles);
  $$AlbumsTableTableManager get albums =>
      $$AlbumsTableTableManager(_db, _db.albums);
  $$AlbumFilesTableTableManager get albumFiles =>
      $$AlbumFilesTableTableManager(_db, _db.albumFiles);
}
