import 'package:budget_tracker/src/core/database/tables/categories.dart';
import 'package:drift/drift.dart';

class TransactionsDataModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get sum => real()();
  IntColumn get typeId => integer()();
  IntColumn get categoryId => integer().references(CategoriesDataModel, #id)();
  DateTimeColumn get date => dateTime()();
}
