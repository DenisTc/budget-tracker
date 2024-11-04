part of 'category_list_cubit.dart';

@immutable
sealed class CategoryListState {}

final class CategoryListInitial extends CategoryListState {}

class CategoryListLoading extends CategoryListState {}

class CategoryListLoadSuccess extends CategoryListState {
  final List<CategoryModel> categories;

  CategoryListLoadSuccess(this.categories);
}

class CategoryListError extends CategoryListState {}
