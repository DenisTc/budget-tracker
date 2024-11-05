import 'package:budget_tracker/src/feature/statistics/data/models/monthly_transaction_summary_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MonthlyProfitDiagram extends StatelessWidget {
  const MonthlyProfitDiagram(this.data, {super.key});

  final List<MonthlyTransactionSummaryModel> data;

  @override
  Widget build(BuildContext context) {
    final dataChar = data
        .map((d) => MapEntry(
              d.monthName,
              d.netDifference,
            ))
        .toList();

    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        primaryYAxis: const NumericAxis(),
        series: [
          ColumnSeries<MapEntry<String, double>, String>(
            dataSource: dataChar,
            xValueMapper: (MapEntry<String, double> data, _) => data.key,
            yValueMapper: (MapEntry<String, double> data, _) => data.value,
            pointColorMapper: (MapEntry<String, double> data, _) =>
                colorFromString(data.key),
          ),
        ],
      ),
    );
  }
}

Color colorFromString(String text) {
  int hash = 5381;
  for (int i = 0; i < text.length; i++) {
    hash = ((hash << 5) + hash) +
        text.codeUnitAt(i); // hash * 33 + code of character
  }

  // Извлекаем значения для RGB из хэша
  int red = (hash & 0xFF0000) >> 16;
  int green = (hash & 0x00FF00) >> 8;
  int blue = hash & 0x0000FF;

  return Color.fromARGB(255, red, green, blue); // Полная непрозрачность (255)
}
