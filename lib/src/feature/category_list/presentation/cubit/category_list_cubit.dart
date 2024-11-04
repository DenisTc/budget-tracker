import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:budget_tracker/src/feature/category/data/models/category.dart';
import 'package:budget_tracker/src/feature/category/domain/usecases/get_categories.dart';

part 'category_list_state.dart';

@singleton
class CategoryListCubit extends Cubit<CategoryListState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  CategoryListCubit(final GetCategoriesUseCase getCategoriesUseCase)
      : _getCategoriesUseCase = getCategoriesUseCase,
        super(CategoryListLoading());

  Future<void> getCategories() async {
    try {
      final categories = await _getCategoriesUseCase();
      emit(CategoryListLoadSuccess(categories));
    } catch (e) {
      emit(CategoryListError());
    }
  }
}
