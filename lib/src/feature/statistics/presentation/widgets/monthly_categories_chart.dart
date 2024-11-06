import 'package:budget_tracker/src/core/extension/string_extension.dart';
import 'package:budget_tracker/src/feature/statistics/data/models/monthly_transaction_summary_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MonthlyCategoriesChart extends StatelessWidget {
  const MonthlyCategoriesChart(this.data, {super.key});

  final List<MonthlyTransactionSummaryModel> data;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 400.0,
        viewportFraction: 0.7,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        initialPage: data.length - 1,
      ),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        final currentMonthData = data[itemIndex];
        final dataChar = currentMonthData.categoryDataList
            .map((data) => MapEntry(
                  data.categoryName,
                  data.totalExpense + data.totalIncome,
                ))
            .toList();

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${currentMonthData.monthName.capitalize()} ${currentMonthData.year}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SfCircularChart(
              margin: EdgeInsets.zero,
              legend: const Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                overflowMode: LegendItemOverflowMode.wrap,
              ),
              series: [
                PieSeries<MapEntry<String, double>, String>(
                  dataSource: dataChar,
                  animationDuration: 0,
                  xValueMapper: (MapEntry<String, double> data, _) => data.key,
                  yValueMapper: (MapEntry<String, double> data, _) =>
                      data.value,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
