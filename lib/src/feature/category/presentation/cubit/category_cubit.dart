import 'package:bloc/bloc.dart';
import 'package:budget_tracker/src/feature/category/data/models/category.dart';
import 'package:budget_tracker/src/feature/category/domain/usecases/add_category.dart';
import 'package:budget_tracker/src/feature/category/domain/usecases/check_is_exist_category.dart';
import 'package:budget_tracker/src/feature/category/domain/usecases/remove_category.dart';
import 'package:budget_tracker/src/feature/category/domain/usecases/update_category.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'category_state.dart';

@singleton
class CategoryCubit extends Cubit<CategoryState> {
  final AddCategoryUseCase _addCategory;
  final RemoveCategoryUseCase _removeCategory;
  final UpdateCategoryUseCase _updateCategory;
  final CheckisExistCategoryUseCase _checkIsExistCategory;

  CategoryCubit({
    required AddCategoryUseCase addCategory,
    required RemoveCategoryUseCase removeCategory,
    required UpdateCategoryUseCase updateCategory,
    required CheckisExistCategoryUseCase checkisExistCategory,
  })  : _addCategory = addCategory,
        _removeCategory = removeCategory,
        _updateCategory = updateCategory,
        _checkIsExistCategory = checkisExistCategory,
        super(CategoryLoading());

  Future<void> addCategory(CategoryModel category) async {
    try {
      final isExist = await _checkIsExistCategory(category.title);
      if (isExist) {
        emit(const CategoryError(CategoryErrorEnum.isExist));
      } else {
        await _addCategory(category);
        emit(CategoryAddSuccess());
      }
    } catch (e) {
      emit(const CategoryError());
    }
  }

  Future<void> removeCategory(int id) async {
    try {
      await _removeCategory(id);
      emit(CategoryRemoveSuccess());
    } catch (e) {
      emit(const CategoryError());
    }
  }

  Future<void> updateCategory(CategoryModel category) async {
    try {
      await _updateCategory(category);
      emit(CategoryUpdateSuccess());
    } catch (e) {
      emit(const CategoryError());
    }
  }
}
