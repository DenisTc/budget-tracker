import 'package:budget_tracker/src/core/database/app_database.dart';
import 'package:budget_tracker/src/feature/statistics/data/models/monthly_transaction_summary_model.dart';
import 'package:injectable/injectable.dart';

abstract interface class StatisticsLocalDataSource {
  Future<List<MonthlyTransactionSummaryModel>> getStatistics();
}

@LazySingleton(as: StatisticsLocalDataSource)
class StatisticsLocalDataSourceImpl implements StatisticsLocalDataSource {
  final AppDatabase db;

  StatisticsLocalDataSourceImpl(this.db);

  @override
  Future<List<MonthlyTransactionSummaryModel>> getStatistics() async =>
      await db.transactionsDao.getTransactionStatistics();
}
