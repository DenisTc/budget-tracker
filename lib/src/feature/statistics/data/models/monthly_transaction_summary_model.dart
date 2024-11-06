import 'package:budget_tracker/src/feature/statistics/data/models/monthly_category_data_model.dart';
import 'package:budget_tracker/src/feature/statistics/domain/entities/monthly_transaction_summary.dart';

class MonthlyTransactionSummaryModel extends MonthlyTransactionSummary {
  const MonthlyTransactionSummaryModel({
    required super.monthName,
    required super.year,
    required List<MonthlyCategoryDataModel> super.categoryDataList,
    required super.totalIncome,
    required super.totalExpense,
  });
}
