import 'package:budget_tracker/src/feature/statistics/data/models/monthly_category_data_model.dart';

class MonthlyTransactionSummaryModel {
  final String monthName;
  final int year;
  final List<MonthlyCategoryDataModel> categoryDataList;
  final double totalIncome;
  final double totalExpense;
  final double netDifference;

  MonthlyTransactionSummaryModel({
    required this.monthName,
    required this.year,
    required this.categoryDataList,
    required this.totalIncome,
    required this.totalExpense,
  }) : netDifference = totalIncome - totalExpense;
}
