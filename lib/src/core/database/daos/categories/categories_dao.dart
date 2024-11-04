import 'package:budget_tracker/src/core/database/app_database.dart';
import 'package:budget_tracker/src/core/database/tables/categories.dart';
import 'package:budget_tracker/src/core/database/tables/transactions.dart';
import 'package:drift/drift.dart';
import 'package:budget_tracker/src/feature/category/data/models/category.dart';

part 'categories_dao.g.dart';

@DriftAccessor(
  tables: [CategoriesDataModel, TransactionsDataModel],
)
class CategoriesDao extends DatabaseAccessor<AppDatabase>
    with _$CategoriesDaoMixin {
  CategoriesDao(super.db);

  Future<List<CategoryModel>> getListCategory() async {
    final items = await (select(categoriesDataModel)).get();
    final result = items.map((item) => item.toGetCategory()).toList();
    return result;
  }

  Future<void> insertCategory(CategoryModel category) async {
    await into(categoriesDataModel).insert(
      CategoriesDataModelCompanion(
        title: Value(category.title),
      ),
    );
  }

  Future<void> updateCategory(CategoryModel category) async {
    await (update(categoriesDataModel)
          ..where((tbl) => tbl.id.equals(category.id)))
        .write(
      CategoriesDataModelCompanion(
        id: const Value.absent(),
        title: Value(category.title),
      ),
    );
  }

  Future<bool> isCategoryExists(String title) async {
    final query = select(categoriesDataModel)
      ..where((tbl) => tbl.title.lower().equals(title.toLowerCase()))
      ..limit(1);

    final result = await query.get();
    return result.isNotEmpty;
  }

  Future<bool> isCanBeDelete(int categoryId) async {
    final count = await (select(transactionsDataModel)
          ..where((t) => t.categoryId.equals(categoryId)))
        .get();

    return count.isEmpty;
  }

  Future<void> remove(int id) async {
    await (delete(categoriesDataModel)..where((c) => c.id.equals(id))).go();
  }
}

extension on CategoriesDataModelData {
  CategoryModel toGetCategory() {
    return CategoryModel(
      id: id,
      title: title,
    );
  }
}
