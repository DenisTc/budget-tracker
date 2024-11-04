// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CategoriesDataModelTable extends CategoriesDataModel
    with TableInfo<$CategoriesDataModelTable, CategoriesDataModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesDataModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories_data_model';
  @override
  VerificationContext validateIntegrity(
      Insertable<CategoriesDataModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoriesDataModelData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoriesDataModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  @override
  $CategoriesDataModelTable createAlias(String alias) {
    return $CategoriesDataModelTable(attachedDatabase, alias);
  }
}

class CategoriesDataModelData extends DataClass
    implements Insertable<CategoriesDataModelData> {
  final int id;
  final String title;
  const CategoriesDataModelData({required this.id, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  CategoriesDataModelCompanion toCompanion(bool nullToAbsent) {
    return CategoriesDataModelCompanion(
      id: Value(id),
      title: Value(title),
    );
  }

  factory CategoriesDataModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoriesDataModelData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  CategoriesDataModelData copyWith({int? id, String? title}) =>
      CategoriesDataModelData(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  CategoriesDataModelData copyWithCompanion(CategoriesDataModelCompanion data) {
    return CategoriesDataModelData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesDataModelData(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoriesDataModelData &&
          other.id == this.id &&
          other.title == this.title);
}

class CategoriesDataModelCompanion
    extends UpdateCompanion<CategoriesDataModelData> {
  final Value<int> id;
  final Value<String> title;
  const CategoriesDataModelCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  CategoriesDataModelCompanion.insert({
    this.id = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<CategoriesDataModelData> custom({
    Expression<int>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  CategoriesDataModelCompanion copyWith(
      {Value<int>? id, Value<String>? title}) {
    return CategoriesDataModelCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesDataModelCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesDataModelTable categoriesDataModel =
      $CategoriesDataModelTable(this);
  late final CategoriesDao categoriesDao = CategoriesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [categoriesDataModel];
}

typedef $$CategoriesDataModelTableCreateCompanionBuilder
    = CategoriesDataModelCompanion Function({
  Value<int> id,
  required String title,
});
typedef $$CategoriesDataModelTableUpdateCompanionBuilder
    = CategoriesDataModelCompanion Function({
  Value<int> id,
  Value<String> title,
});

class $$CategoriesDataModelTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesDataModelTable> {
  $$CategoriesDataModelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));
}

class $$CategoriesDataModelTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesDataModelTable> {
  $$CategoriesDataModelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));
}

class $$CategoriesDataModelTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesDataModelTable> {
  $$CategoriesDataModelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);
}

class $$CategoriesDataModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesDataModelTable,
    CategoriesDataModelData,
    $$CategoriesDataModelTableFilterComposer,
    $$CategoriesDataModelTableOrderingComposer,
    $$CategoriesDataModelTableAnnotationComposer,
    $$CategoriesDataModelTableCreateCompanionBuilder,
    $$CategoriesDataModelTableUpdateCompanionBuilder,
    (
      CategoriesDataModelData,
      BaseReferences<_$AppDatabase, $CategoriesDataModelTable,
          CategoriesDataModelData>
    ),
    CategoriesDataModelData,
    PrefetchHooks Function()> {
  $$CategoriesDataModelTableTableManager(
      _$AppDatabase db, $CategoriesDataModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesDataModelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesDataModelTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesDataModelTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
          }) =>
              CategoriesDataModelCompanion(
            id: id,
            title: title,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
          }) =>
              CategoriesDataModelCompanion.insert(
            id: id,
            title: title,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoriesDataModelTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoriesDataModelTable,
    CategoriesDataModelData,
    $$CategoriesDataModelTableFilterComposer,
    $$CategoriesDataModelTableOrderingComposer,
    $$CategoriesDataModelTableAnnotationComposer,
    $$CategoriesDataModelTableCreateCompanionBuilder,
    $$CategoriesDataModelTableUpdateCompanionBuilder,
    (
      CategoriesDataModelData,
      BaseReferences<_$AppDatabase, $CategoriesDataModelTable,
          CategoriesDataModelData>
    ),
    CategoriesDataModelData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesDataModelTableTableManager get categoriesDataModel =>
      $$CategoriesDataModelTableTableManager(_db, _db.categoriesDataModel);
}
