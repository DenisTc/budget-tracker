import 'package:budget_tracker/src/feature/category/domain/repos/transaction_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CheckisExistCategoryUseCase {
  final CategoryRepository _categoryRepository;

  CheckisExistCategoryUseCase(this._categoryRepository);

  Future<bool> call(String title) async =>
      _categoryRepository.checkIsExist(title);
}
