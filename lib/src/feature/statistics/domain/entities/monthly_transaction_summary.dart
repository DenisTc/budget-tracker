import 'package:budget_tracker/src/feature/statistics/domain/entities/monthly_category_data.dart';
import 'package:equatable/equatable.dart';

class MonthlyTransactionSummary extends Equatable {
  final String monthName;
  final int year;
  final List<MonthlyCategoryData> categoryDataList;
  final double totalIncome;
  final double totalExpense;
  final double netDifference;

  const MonthlyTransactionSummary({
    required this.monthName,
    required this.year,
    required this.categoryDataList,
    required this.totalIncome,
    required this.totalExpense,
  }) : netDifference = totalIncome - totalExpense;

  @override
  List<Object?> get props => [monthName, year];
}
