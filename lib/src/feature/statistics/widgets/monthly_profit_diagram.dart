import 'package:budget_tracker/src/core/constant/app_sizes.dart';
import 'package:budget_tracker/src/core/localization/generated/l10n.dart';
import 'package:budget_tracker/src/feature/statistics/data/models/monthly_transaction_summary_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MonthlyProfitDiagram extends StatelessWidget {
  const MonthlyProfitDiagram(this.data, {super.key});

  final List<MonthlyTransactionSummaryModel> data;

  @override
  Widget build(BuildContext context) {
    final dataChar = data
        .map((d) => _ChartData(d.monthName, d.totalExpense, d.totalIncome))
        .toList();

    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        children: [
          SfCartesianChart(
            primaryXAxis: const CategoryAxis(),
            primaryYAxis: const NumericAxis(),
            series: [
              ColumnSeries<_ChartData, String>(
                dataSource: dataChar,
                animationDuration: 0,
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y1,
                pointColorMapper: (_ChartData data, _) => Colors.green,
              ),
              ColumnSeries<_ChartData, String>(
                dataSource: dataChar,
                opacity: 0.9,
                width: 0.4,
                animationDuration: 0,
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y,
                pointColorMapper: (_ChartData data, _) => Colors.red,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ColorCircleLabel(
                color: Colors.green,
                size: 12,
                label: S.of(context).income,
              ),
              const SizedBox(width: 16),
              AppSizes.gapW16,
              _ColorCircleLabel(
                color: Colors.red,
                size: 12,
                label: S.of(context).expense,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.y1);
  final String x;
  final double y;
  final double y1;
}

class _ColorCircleLabel extends StatelessWidget {
  final Color color;
  final String label;
  final double size;

  const _ColorCircleLabel({
    required this.color,
    required this.label,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
