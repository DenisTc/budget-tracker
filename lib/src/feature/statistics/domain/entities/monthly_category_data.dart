import 'package:equatable/equatable.dart';

class MonthlyCategoryData extends Equatable {
  final String categoryName;
  final double totalExpense;
  final double totalIncome;
  final int totalOperation;

  const MonthlyCategoryData({
    required this.categoryName,
    required this.totalExpense,
    required this.totalIncome,
    required this.totalOperation,
  });

  @override
  List<Object?> get props => [
        categoryName,
        totalExpense,
        totalIncome,
        totalOperation,
      ];
}
