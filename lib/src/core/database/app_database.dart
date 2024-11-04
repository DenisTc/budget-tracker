import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:budget_tracker/src/core/database/daos/categories/categories_dao.dart';
import 'package:budget_tracker/src/core/database/daos/transactions/transactions_dao.dart';
import 'package:budget_tracker/src/core/database/tables/categories.dart';
import 'package:budget_tracker/src/core/database/tables/transactions.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    CategoriesDataModel,
    TransactionsDataModel,
  ],
  daos: [
    TransactionsDao,
    CategoriesDao,
  ],
)
@lazySingleton
class AppDatabase extends _$AppDatabase {
  static AppDatabase instance() => AppDatabase();

  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
