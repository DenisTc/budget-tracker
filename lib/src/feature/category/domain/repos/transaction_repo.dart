import 'package:budget_tracker/src/feature/category/data/models/category.dart';

abstract interface class CategoryRepository {
  Future<List<CategoryModel>> getCategories();

  Future<void> add(CategoryModel category);

  Future<void> update(CategoryModel category);

  Future<void> remove(int id);

  Future<bool> checkIsExist(String title);
}
