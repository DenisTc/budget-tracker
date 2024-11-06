import 'package:budget_tracker/src/feature/statistics/data/models/monthly_transaction_summary_model.dart';
import 'package:budget_tracker/src/feature/statistics/domain/repos/statistics_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetStatisticsUseCase {
  final StatisticsRepository _statisticsRepository;

  GetStatisticsUseCase(this._statisticsRepository);

  Future<List<MonthlyTransactionSummaryModel>> call() async =>
      _statisticsRepository.getStatistics();
}
