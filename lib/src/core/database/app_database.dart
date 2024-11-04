import 'dart:io';

import 'package:budget_tracker/src/core/database/daos/categories/categories_dao.dart';
import 'package:budget_tracker/src/core/database/tables/categories.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    CategoriesDataModel,
  ],
  daos: [
    CategoriesDao,
  ],
)
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
