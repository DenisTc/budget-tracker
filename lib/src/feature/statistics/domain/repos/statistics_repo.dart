import 'package:budget_tracker/src/feature/statistics/data/models/monthly_transaction_summary_model.dart';

abstract interface class StatisticsRepository {
  Future<List<MonthlyTransactionSummaryModel>> getStatistics();
}
