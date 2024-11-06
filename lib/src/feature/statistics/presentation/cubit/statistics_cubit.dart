import 'package:bloc/bloc.dart';
import 'package:budget_tracker/src/feature/statistics/data/models/monthly_transaction_summary_model.dart';
import 'package:budget_tracker/src/feature/statistics/domain/usecases/get_statistics.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'statistics_state.dart';

@singleton
class StatisticsCubit extends Cubit<StatisticsState> {
  final GetStatisticsUseCase _getStatistics;
  StatisticsCubit(GetStatisticsUseCase getStatistics)
      : _getStatistics = getStatistics,
        super(StatisticsLoading());

  Future<void> getStatistics() async {
    emit(StatisticsLoading());

    try {
      final result = await _getStatistics();

      emit(StatisticsLoadSuccess(result));
    } catch (e) {
      emit(StatisticsError());
    }
  }
}
