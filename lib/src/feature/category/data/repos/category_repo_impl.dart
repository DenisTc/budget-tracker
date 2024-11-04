import 'package:budget_tracker/src/feature/category/data/datasource/category_local_data_source.dart';
import 'package:budget_tracker/src/feature/category/data/models/category.dart';
import 'package:budget_tracker/src/feature/category/domain/repos/transaction_repo.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  const CategoryRepositoryImpl(this._localDataSource);

  final CategoryLocalDataSource _localDataSource;

  @override
  Future<void> add(CategoryModel category) async =>
      _localDataSource.add(category);

  @override
  Future<List<CategoryModel>> getCategories() async =>
      _localDataSource.getCategories();

  @override
  Future<void> remove(int id) async => _localDataSource.remove(id);

  @override
  Future<void> update(CategoryModel category) async =>
      _localDataSource.update(category);

  @override
  Future<bool> checkIsExist(String title) async =>
      _localDataSource.checkIsExist(title);
}
