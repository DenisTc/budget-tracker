import 'package:budget_tracker/src/feature/category/data/models/category.dart';
import 'package:budget_tracker/src/feature/category/domain/repos/transaction_repo.dart';

class GetCategoriesUseCase {
  final CategoryRepository _categoryRepository;

  GetCategoriesUseCase(this._categoryRepository);

  Future<List<CategoryModel>> call() async =>
      _categoryRepository.getCategories();
}
