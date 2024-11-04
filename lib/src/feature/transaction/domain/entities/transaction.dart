import 'package:budget_tracker/src/feature/category/data/models/category.dart';
import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final int id;
  final double sum;
  final int typeId;
  final CategoryModel category;
  final DateTime date;

  const Transaction({
    required this.id,
    required this.sum,
    required this.typeId,
    required this.category,
    required this.date,
  });

  @override
  List<Object?> get props => [id];
}
