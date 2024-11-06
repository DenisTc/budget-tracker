part of 'statistics_cubit.dart';

sealed class StatisticsState extends Equatable {
  const StatisticsState();

  @override
  List<Object> get props => [];
}

final class StatisticsInitial extends StatisticsState {}

class StatisticsLoading extends StatisticsState {}

class StatisticsLoadSuccess extends StatisticsState {
  final List<MonthlyTransactionSummaryModel> statistics;

  const StatisticsLoadSuccess(this.statistics);
}

class StatisticsError extends StatisticsState {}
