part of 'category_cubit.dart';

enum CategoryErrorEnum {
  isExist,
  other,
}

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryAddSuccess extends CategoryState {}

class CategoryRemoveSuccess extends CategoryState {}

class CategoryUpdateSuccess extends CategoryState {}

class CategoryError extends CategoryState {
  final CategoryErrorEnum error;

  const CategoryError([this.error = CategoryErrorEnum.other]);
}
