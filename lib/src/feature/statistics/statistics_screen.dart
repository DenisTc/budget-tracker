import 'package:budget_tracker/src/core/constant/app_sizes.dart';
import 'package:budget_tracker/src/core/localization/generated/l10n.dart';
import 'package:budget_tracker/src/feature/statistics/utils/get_monthly_transaction_summary.dart';
import 'package:budget_tracker/src/feature/statistics/widgets/monthly_categories_chart.dart';
import 'package:budget_tracker/src/feature/statistics/widgets/monthly_profit_diagram.dart';
import 'package:budget_tracker/src/feature/statistics/widgets/statistic_placeholder.dart';
import 'package:budget_tracker/src/feature/statistics/widgets/statistic_title.dart';
import 'package:budget_tracker/src/feature/transaction_list/presentation/cubit/transaction_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TransactionListCubit, TransactionListState>(
          builder: (context, state) {
            if (state is TransactionListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TransactionListLoadSuccess) {
              if (state.transactions.isEmpty) {
                return const StatisticPlaceholder();
              }

              final data = summarizeTransactions(state.transactions);

              return ListView(
                shrinkWrap: true,
                children: [
                  StatisticTitle(S.of(context).usedCategories),
                  AppSizes.gapH16,
                  MonthlyCategoriesChart(data),
                  StatisticTitle(S.of(context).incomeAndExpenses),
                  AppSizes.gapH16,
                  MonthlyProfitDiagram(data),
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
