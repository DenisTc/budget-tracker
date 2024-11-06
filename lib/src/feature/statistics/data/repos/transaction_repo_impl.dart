import 'package:budget_tracker/src/feature/statistics/data/models/monthly_transaction_summary_model.dart';
import 'package:budget_tracker/src/feature/statistics/domain/repos/statistics_repo.dart';
import 'package:budget_tracker/src/feature/transaction/data/datasource/transaction_local_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: StatisticsRepository)
class StatisticsRepositoryImpl implements StatisticsRepository {
  const StatisticsRepositoryImpl(this._localDataSource);

  final TransactionLocalDataSource _localDataSource;

  @override
  Future<List<MonthlyTransactionSummaryModel>> getStatistics() async =>
      _localDataSource.getStatistics();
}
