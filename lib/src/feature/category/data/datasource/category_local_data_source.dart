import 'package:budget_tracker/src/core/database/app_database.dart';
import 'package:budget_tracker/src/feature/category/data/models/category.dart';

abstract interface class CategoryLocalDataSource {
  Future<List<CategoryModel>> getCategories();

  Future<void> add(CategoryModel category);

  Future<void> remove(int id);

  Future<void> update(CategoryModel category);

  Future<bool> checkIsExist(String title);
}

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  final AppDatabase db;

  CategoryLocalDataSourceImpl(this.db);

  @override
  Future<void> add(CategoryModel category) async =>
      await db.categoriesDao.insertCategory(category);

  @override
  Future<List<CategoryModel>> getCategories() async =>
      await db.categoriesDao.getListCategory();

  @override
  Future<void> remove(int id) async => await db.categoriesDao.remove(id);

  @override
  Future<void> update(CategoryModel category) async =>
      await db.categoriesDao.updateCategory(category);

  @override
  Future<bool> checkIsExist(String title) async =>
      await db.categoriesDao.isCategoryExists(title);
}
