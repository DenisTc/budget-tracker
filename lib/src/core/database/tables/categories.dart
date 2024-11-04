import 'package:drift/drift.dart';

class CategoriesDataModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
}
