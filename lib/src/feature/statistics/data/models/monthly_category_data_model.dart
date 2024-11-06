import 'package:budget_tracker/src/feature/statistics/domain/entities/monthly_category_data.dart';

class MonthlyCategoryDataModel extends MonthlyCategoryData {
  const MonthlyCategoryDataModel({
    required super.categoryName,
    required super.totalExpense,
    required super.totalIncome,
    required super.totalOperation,
  });
}
