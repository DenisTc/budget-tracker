import 'package:budget_tracker/src/feature/category/data/models/category.dart';
import 'package:budget_tracker/src/feature/category/domain/repos/transaction_repo.dart';

class UpdateCategoryUseCase {
  final CategoryRepository _categoryRepository;

  UpdateCategoryUseCase(this._categoryRepository);

  Future<void> call(CategoryModel category) async =>
      _categoryRepository.update(category);
}
