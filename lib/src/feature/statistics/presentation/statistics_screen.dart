import 'package:budget_tracker/src/core/constant/app_sizes.dart';
import 'package:budget_tracker/src/core/localization/generated/l10n.dart';
import 'package:budget_tracker/src/feature/statistics/presentation/cubit/statistics_cubit.dart';
import 'package:budget_tracker/src/feature/statistics/presentation/widgets/monthly_categories_chart.dart';
import 'package:budget_tracker/src/feature/statistics/presentation/widgets/monthly_profit_diagram.dart';
import 'package:budget_tracker/src/feature/statistics/presentation/widgets/statistic_placeholder.dart';
import 'package:budget_tracker/src/feature/statistics/presentation/widgets/statistic_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StatisticsCubit>().getStatistics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<StatisticsCubit, StatisticsState>(
          builder: (context, state) {
            if (state is StatisticsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is StatisticsLoadSuccess) {
              if (state.statistics.isEmpty) {
                return const StatisticPlaceholder();
              }

              return ListView(
                shrinkWrap: true,
                children: [
                  StatisticTitle(S.of(context).usedCategories),
                  AppSizes.gapH16,
                  MonthlyCategoriesChart(state.statistics),
                  StatisticTitle(S.of(context).incomeAndExpenses),
                  AppSizes.gapH16,
                  MonthlyProfitDiagram(state.statistics),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
