import 'package:budget_tracker/src/feature/category/domain/repos/transaction_repo.dart';

class RemoveCategoryUseCase {
  final CategoryRepository _categoryRepository;

  RemoveCategoryUseCase(this._categoryRepository);

  Future<void> call(int id) async => _categoryRepository.remove(id);
}
