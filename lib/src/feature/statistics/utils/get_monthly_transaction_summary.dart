import 'package:budget_tracker/src/core/enums/operation_type.dart';
import 'package:budget_tracker/src/feature/statistics/data/models/monthly_category_data_model.dart';
import 'package:budget_tracker/src/feature/statistics/data/models/monthly_transaction_summary_model.dart';
import 'package:budget_tracker/src/feature/transaction/domain/entities/transaction.dart';
import 'package:intl/intl.dart';

/// Генерирует список сводных данных по транзакциям за каждый месяц.
///
/// Сначала сортирует транзакции по дате, чтобы они шли от самых старых
/// к самым новым. Затем группируем транзакции по месяцам, подсчитываем доходы, расходы
/// и кол-во операций для каждой категории в каждом месяце.
///
/// Параметры:
/// - [transactions]: Список транзакций.
///
/// Возвращаем:
/// - Список объектов MonthlyTransactionSummaryModel, где каждый объект представляет данные
/// за отдельный месяц.
List<MonthlyTransactionSummaryModel> getMonthlyTransactionSummary(
  List<Transaction> transactions,
) {
  transactions.sort((a, b) => a.date.compareTo(b.date));

  final Map<String, Map<String, dynamic>> monthlyDataMap = {};

  for (var transaction in transactions) {
    final monthKey = _getMonthKeyForMap(transaction.date);

    _initializeMonthDataIfAbsent(
      monthlyDataMap,
      monthKey,
      transaction.date,
    );

    final monthData = monthlyDataMap[monthKey]!;

    _updateCategoryData(
      monthData,
      transaction.category.title,
      transaction.typeId,
      transaction.sum,
    );
  }

  return _mapToMonthlyTransactionSummaryList(monthlyDataMap);
}

String _getMonthKeyForMap(DateTime date) {
  return "${_getMonthName(date.month)} ${date.year}";
}

String _getMonthName(int month) {
  return DateFormat('MMMM', 'ru').format(DateTime(0, month));
}

/// Формируем данные за месяц, если их ещё нет.
void _initializeMonthDataIfAbsent(
  Map<String, Map<String, dynamic>> monthlyDataMap,
  String monthKey,
  DateTime date,
) {
  if (!monthlyDataMap.containsKey(monthKey)) {
    monthlyDataMap[monthKey] = {
      'year': date.year,
      'categories': <String, Map<String, dynamic>>{},
      'totalIncome': 0.0,
      'totalExpense': 0.0,
    };
  }
}

/// Обновляем данные по категории в зависимости от типа транзакции
void _updateCategoryData(
  Map<String, dynamic> monthData,
  String categoryName,
  int transactionType,
  double amount,
) {
  final categories =
      monthData['categories'] as Map<String, Map<String, dynamic>>;

  if (!categories.containsKey(categoryName)) {
    categories[categoryName] = {
      'totalExpense': 0.0,
      'totalIncome': 0.0,
      'totalOperation': 0,
    };
  }

  final categoryData = categories[categoryName]!;

  categoryData['totalOperation'] += 1;

  /// Обновляем значение доходов и расходов в зависимости от типа транзакции
  if (transactionType == OperationTypeEnum.expense.value) {
    monthData['totalExpense'] += amount;
    categoryData['totalExpense'] += amount;
  } else if (transactionType == 1) {
    monthData['totalIncome'] += amount;
    categoryData['totalIncome'] += amount;
  }
}

/// Преобразуем данные в список моделей MonthlyTransactionSummaryModel
List<MonthlyTransactionSummaryModel> _mapToMonthlyTransactionSummaryList(
  Map<String, Map<String, dynamic>> monthlyDataMap,
) {
  return monthlyDataMap.entries.map((entry) {
    final monthName = entry.key.split(' ')[0];
    final year = entry.value['year'] as int;
    final totalIncome = entry.value['totalIncome'] as double;
    final totalExpense = entry.value['totalExpense'] as double;

    final categoryDataList =
        (entry.value['categories'] as Map<String, Map<String, dynamic>>)
            .entries
            .map(
              (categoryEntry) => MonthlyCategoryDataModel(
                categoryName: categoryEntry.key,
                totalExpense: categoryEntry.value['totalExpense'] as double,
                totalIncome: categoryEntry.value['totalIncome'] as double,
                totalOperation: categoryEntry.value['totalOperation'] as int,
              ),
            )
            .toList();

    return MonthlyTransactionSummaryModel(
      monthName: monthName,
      year: year,
      categoryDataList: categoryDataList,
      totalIncome: totalIncome,
      totalExpense: totalExpense,
    );
  }).toList();
}
