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

class $TransactionsDataModelTable extends TransactionsDataModel
    with TableInfo<$TransactionsDataModelTable, TransactionsDataModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsDataModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sumMeta = const VerificationMeta('sum');
  @override
  late final GeneratedColumn<double> sum = GeneratedColumn<double>(
      'sum', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _typeIdMeta = const VerificationMeta('typeId');
  @override
  late final GeneratedColumn<int> typeId = GeneratedColumn<int>(
      'type_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES categories_data_model (id)'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, sum, typeId, categoryId, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions_data_model';
  @override
  VerificationContext validateIntegrity(
      Insertable<TransactionsDataModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sum')) {
      context.handle(
          _sumMeta, sum.isAcceptableOrUnknown(data['sum']!, _sumMeta));
    } else if (isInserting) {
      context.missing(_sumMeta);
    }
    if (data.containsKey('type_id')) {
      context.handle(_typeIdMeta,
          typeId.isAcceptableOrUnknown(data['type_id']!, _typeIdMeta));
    } else if (isInserting) {
      context.missing(_typeIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionsDataModelData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionsDataModelData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sum: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sum'])!,
      typeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $TransactionsDataModelTable createAlias(String alias) {
    return $TransactionsDataModelTable(attachedDatabase, alias);
  }
}

class TransactionsDataModelData extends DataClass
    implements Insertable<TransactionsDataModelData> {
  final int id;
  final double sum;
  final int typeId;
  final int categoryId;
  final DateTime date;
  const TransactionsDataModelData(
      {required this.id,
      required this.sum,
      required this.typeId,
      required this.categoryId,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sum'] = Variable<double>(sum);
    map['type_id'] = Variable<int>(typeId);
    map['category_id'] = Variable<int>(categoryId);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  TransactionsDataModelCompanion toCompanion(bool nullToAbsent) {
    return TransactionsDataModelCompanion(
      id: Value(id),
      sum: Value(sum),
      typeId: Value(typeId),
      categoryId: Value(categoryId),
      date: Value(date),
    );
  }

  factory TransactionsDataModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionsDataModelData(
      id: serializer.fromJson<int>(json['id']),
      sum: serializer.fromJson<double>(json['sum']),
      typeId: serializer.fromJson<int>(json['typeId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sum': serializer.toJson<double>(sum),
      'typeId': serializer.toJson<int>(typeId),
      'categoryId': serializer.toJson<int>(categoryId),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  TransactionsDataModelData copyWith(
          {int? id,
          double? sum,
          int? typeId,
          int? categoryId,
          DateTime? date}) =>
      TransactionsDataModelData(
        id: id ?? this.id,
        sum: sum ?? this.sum,
        typeId: typeId ?? this.typeId,
        categoryId: categoryId ?? this.categoryId,
        date: date ?? this.date,
      );
  TransactionsDataModelData copyWithCompanion(
      TransactionsDataModelCompanion data) {
    return TransactionsDataModelData(
      id: data.id.present ? data.id.value : this.id,
      sum: data.sum.present ? data.sum.value : this.sum,
      typeId: data.typeId.present ? data.typeId.value : this.typeId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsDataModelData(')
          ..write('id: $id, ')
          ..write('sum: $sum, ')
          ..write('typeId: $typeId, ')
          ..write('categoryId: $categoryId, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sum, typeId, categoryId, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionsDataModelData &&
          other.id == this.id &&
          other.sum == this.sum &&
          other.typeId == this.typeId &&
          other.categoryId == this.categoryId &&
          other.date == this.date);
}

class TransactionsDataModelCompanion
    extends UpdateCompanion<TransactionsDataModelData> {
  final Value<int> id;
  final Value<double> sum;
  final Value<int> typeId;
  final Value<int> categoryId;
  final Value<DateTime> date;
  const TransactionsDataModelCompanion({
    this.id = const Value.absent(),
    this.sum = const Value.absent(),
    this.typeId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.date = const Value.absent(),
  });
  TransactionsDataModelCompanion.insert({
    this.id = const Value.absent(),
    required double sum,
    required int typeId,
    required int categoryId,
    required DateTime date,
  })  : sum = Value(sum),
        typeId = Value(typeId),
        categoryId = Value(categoryId),
        date = Value(date);
  static Insertable<TransactionsDataModelData> custom({
    Expression<int>? id,
    Expression<double>? sum,
    Expression<int>? typeId,
    Expression<int>? categoryId,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sum != null) 'sum': sum,
      if (typeId != null) 'type_id': typeId,
      if (categoryId != null) 'category_id': categoryId,
      if (date != null) 'date': date,
    });
  }

  TransactionsDataModelCompanion copyWith(
      {Value<int>? id,
      Value<double>? sum,
      Value<int>? typeId,
      Value<int>? categoryId,
      Value<DateTime>? date}) {
    return TransactionsDataModelCompanion(
      id: id ?? this.id,
      sum: sum ?? this.sum,
      typeId: typeId ?? this.typeId,
      categoryId: categoryId ?? this.categoryId,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sum.present) {
      map['sum'] = Variable<double>(sum.value);
    }
    if (typeId.present) {
      map['type_id'] = Variable<int>(typeId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsDataModelCompanion(')
          ..write('id: $id, ')
          ..write('sum: $sum, ')
          ..write('typeId: $typeId, ')
          ..write('categoryId: $categoryId, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesDataModelTable categoriesDataModel =
      $CategoriesDataModelTable(this);
  late final $TransactionsDataModelTable transactionsDataModel =
      $TransactionsDataModelTable(this);
  late final TransactionsDao transactionsDao =
      TransactionsDao(this as AppDatabase);
  late final CategoriesDao categoriesDao = CategoriesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categoriesDataModel, transactionsDataModel];
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

final class $$CategoriesDataModelTableReferences extends BaseReferences<
    _$AppDatabase, $CategoriesDataModelTable, CategoriesDataModelData> {
  $$CategoriesDataModelTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TransactionsDataModelTable,
      List<TransactionsDataModelData>> _transactionsDataModelRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.transactionsDataModel,
          aliasName: $_aliasNameGenerator(
              db.categoriesDataModel.id, db.transactionsDataModel.categoryId));

  $$TransactionsDataModelTableProcessedTableManager
      get transactionsDataModelRefs {
    final manager = $$TransactionsDataModelTableTableManager(
            $_db, $_db.transactionsDataModel)
        .filter((f) => f.categoryId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_transactionsDataModelRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

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

  Expression<bool> transactionsDataModelRefs(
      Expression<bool> Function($$TransactionsDataModelTableFilterComposer f)
          f) {
    final $$TransactionsDataModelTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.transactionsDataModel,
            getReferencedColumn: (t) => t.categoryId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TransactionsDataModelTableFilterComposer(
                  $db: $db,
                  $table: $db.transactionsDataModel,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
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

  Expression<T> transactionsDataModelRefs<T extends Object>(
      Expression<T> Function($$TransactionsDataModelTableAnnotationComposer a)
          f) {
    final $$TransactionsDataModelTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.transactionsDataModel,
            getReferencedColumn: (t) => t.categoryId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TransactionsDataModelTableAnnotationComposer(
                  $db: $db,
                  $table: $db.transactionsDataModel,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
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
    (CategoriesDataModelData, $$CategoriesDataModelTableReferences),
    CategoriesDataModelData,
    PrefetchHooks Function({bool transactionsDataModelRefs})> {
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
              .map((e) => (
                    e.readTable(table),
                    $$CategoriesDataModelTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({transactionsDataModelRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (transactionsDataModelRefs) db.transactionsDataModel
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (transactionsDataModelRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$CategoriesDataModelTableReferences
                            ._transactionsDataModelRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriesDataModelTableReferences(db, table, p0)
                                .transactionsDataModelRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
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
    (CategoriesDataModelData, $$CategoriesDataModelTableReferences),
    CategoriesDataModelData,
    PrefetchHooks Function({bool transactionsDataModelRefs})>;
typedef $$TransactionsDataModelTableCreateCompanionBuilder
    = TransactionsDataModelCompanion Function({
  Value<int> id,
  required double sum,
  required int typeId,
  required int categoryId,
  required DateTime date,
});
typedef $$TransactionsDataModelTableUpdateCompanionBuilder
    = TransactionsDataModelCompanion Function({
  Value<int> id,
  Value<double> sum,
  Value<int> typeId,
  Value<int> categoryId,
  Value<DateTime> date,
});

final class $$TransactionsDataModelTableReferences extends BaseReferences<
    _$AppDatabase, $TransactionsDataModelTable, TransactionsDataModelData> {
  $$TransactionsDataModelTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesDataModelTable _categoryIdTable(_$AppDatabase db) =>
      db.categoriesDataModel.createAlias($_aliasNameGenerator(
          db.transactionsDataModel.categoryId, db.categoriesDataModel.id));

  $$CategoriesDataModelTableProcessedTableManager? get categoryId {
    if ($_item.categoryId == null) return null;
    final manager =
        $$CategoriesDataModelTableTableManager($_db, $_db.categoriesDataModel)
            .filter((f) => f.id($_item.categoryId!));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TransactionsDataModelTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionsDataModelTable> {
  $$TransactionsDataModelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sum => $composableBuilder(
      column: $table.sum, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get typeId => $composableBuilder(
      column: $table.typeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  $$CategoriesDataModelTableFilterComposer get categoryId {
    final $$CategoriesDataModelTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoriesDataModel,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesDataModelTableFilterComposer(
              $db: $db,
              $table: $db.categoriesDataModel,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransactionsDataModelTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionsDataModelTable> {
  $$TransactionsDataModelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sum => $composableBuilder(
      column: $table.sum, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get typeId => $composableBuilder(
      column: $table.typeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  $$CategoriesDataModelTableOrderingComposer get categoryId {
    final $$CategoriesDataModelTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.categoriesDataModel,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CategoriesDataModelTableOrderingComposer(
                  $db: $db,
                  $table: $db.categoriesDataModel,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$TransactionsDataModelTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionsDataModelTable> {
  $$TransactionsDataModelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get sum =>
      $composableBuilder(column: $table.sum, builder: (column) => column);

  GeneratedColumn<int> get typeId =>
      $composableBuilder(column: $table.typeId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  $$CategoriesDataModelTableAnnotationComposer get categoryId {
    final $$CategoriesDataModelTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.categoriesDataModel,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CategoriesDataModelTableAnnotationComposer(
                  $db: $db,
                  $table: $db.categoriesDataModel,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$TransactionsDataModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionsDataModelTable,
    TransactionsDataModelData,
    $$TransactionsDataModelTableFilterComposer,
    $$TransactionsDataModelTableOrderingComposer,
    $$TransactionsDataModelTableAnnotationComposer,
    $$TransactionsDataModelTableCreateCompanionBuilder,
    $$TransactionsDataModelTableUpdateCompanionBuilder,
    (TransactionsDataModelData, $$TransactionsDataModelTableReferences),
    TransactionsDataModelData,
    PrefetchHooks Function({bool categoryId})> {
  $$TransactionsDataModelTableTableManager(
      _$AppDatabase db, $TransactionsDataModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionsDataModelTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionsDataModelTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionsDataModelTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> sum = const Value.absent(),
            Value<int> typeId = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
          }) =>
              TransactionsDataModelCompanion(
            id: id,
            sum: sum,
            typeId: typeId,
            categoryId: categoryId,
            date: date,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double sum,
            required int typeId,
            required int categoryId,
            required DateTime date,
          }) =>
              TransactionsDataModelCompanion.insert(
            id: id,
            sum: sum,
            typeId: typeId,
            categoryId: categoryId,
            date: date,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TransactionsDataModelTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable: $$TransactionsDataModelTableReferences
                        ._categoryIdTable(db),
                    referencedColumn: $$TransactionsDataModelTableReferences
                        ._categoryIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TransactionsDataModelTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $TransactionsDataModelTable,
        TransactionsDataModelData,
        $$TransactionsDataModelTableFilterComposer,
        $$TransactionsDataModelTableOrderingComposer,
        $$TransactionsDataModelTableAnnotationComposer,
        $$TransactionsDataModelTableCreateCompanionBuilder,
        $$TransactionsDataModelTableUpdateCompanionBuilder,
        (TransactionsDataModelData, $$TransactionsDataModelTableReferences),
        TransactionsDataModelData,
        PrefetchHooks Function({bool categoryId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesDataModelTableTableManager get categoriesDataModel =>
      $$CategoriesDataModelTableTableManager(_db, _db.categoriesDataModel);
  $$TransactionsDataModelTableTableManager get transactionsDataModel =>
      $$TransactionsDataModelTableTableManager(_db, _db.transactionsDataModel);
}
