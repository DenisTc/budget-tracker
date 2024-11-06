import 'package:budget_tracker/src/core/enums/operation_type.dart';
import 'package:budget_tracker/src/feature/statistics/data/models/monthly_category_data_model.dart';
import 'package:budget_tracker/src/feature/statistics/data/models/monthly_transaction_summary_model.dart';
import 'package:budget_tracker/src/feature/transaction/domain/entities/transaction.dart';
import 'package:intl/intl.dart';

List<MonthlyTransactionSummaryModel> summarizeDataToStatistics(
  List<Transaction> transactions,
) {
  transactions.sort((a, b) => a.date.compareTo(b.date));

  final groupedTransactions = _groupTransactionsByMonth(transactions);

  return _generateMonthlySummaries(groupedTransactions);
}

Map<String, List<Transaction>> _groupTransactionsByMonth(
  List<Transaction> transactions,
) {
  Map<String, List<Transaction>> groupedTransactions = {};

  for (var transaction in transactions) {
    final monthKey = DateFormat('MMMM-yyyy', 'ru').format(transaction.date);
    if (groupedTransactions.containsKey(monthKey)) {
      groupedTransactions[monthKey]!.add(transaction);
    } else {
      groupedTransactions[monthKey] = [transaction];
    }
  }

  return groupedTransactions;
}

List<MonthlyTransactionSummaryModel> _generateMonthlySummaries(
  Map<String, List<Transaction>> groupedTransactions,
) {
  List<MonthlyTransactionSummaryModel> monthlySummaries = [];

  groupedTransactions.forEach((monthKey, monthlyTransactions) {
    monthlySummaries.add(_createMonthlySummary(monthlyTransactions));
  });

  return monthlySummaries;
}

MonthlyTransactionSummaryModel _createMonthlySummary(
  List<Transaction> monthlyTransactions,
) {
  final monthName =
      DateFormat('MMMM', 'ru').format(monthlyTransactions.first.date);
  final year = monthlyTransactions.first.date.year;

  final totals = _calculateIncomeAndExpenses(monthlyTransactions);
  final categoryDataList = _summarizeCategoryData(monthlyTransactions);

  return MonthlyTransactionSummaryModel(
    monthName: monthName,
    year: year,
    categoryDataList: categoryDataList,
    totalIncome: totals['income']!,
    totalExpense: totals['expense']!,
  );
}

Map<String, double> _calculateIncomeAndExpenses(
  List<Transaction> monthlyTransactions,
) {
  double totalIncome = 0.0;
  double totalExpense = 0.0;

  for (var transaction in monthlyTransactions) {
    if (transaction.typeId == OperationTypeEnum.income.value) {
      totalIncome += transaction.sum;
    } else {
      totalExpense += transaction.sum;
    }
  }
  return {'income': totalIncome, 'expense': totalExpense};
}

List<MonthlyCategoryDataModel> _summarizeCategoryData(
  List<Transaction> monthlyTransactions,
) {
  Map<int, MonthlyCategoryDataModel> categoryDataMap = {};

  for (var transaction in monthlyTransactions) {
    final categoryId = transaction.category.id;
    final categoryTitle = transaction.category.title;

    if (categoryDataMap.containsKey(categoryId)) {
      final existingData = categoryDataMap[categoryId]!;
      categoryDataMap[categoryId] = MonthlyCategoryDataModel(
        categoryName: categoryTitle,
        totalExpense: existingData.totalExpense +
            (transaction.typeId != 1 ? transaction.sum : 0),
        totalIncome: existingData.totalIncome +
            (transaction.typeId == 1 ? transaction.sum : 0),
        totalOperation: existingData.totalOperation + 1,
      );
    } else {
      categoryDataMap[categoryId] = MonthlyCategoryDataModel(
        categoryName: categoryTitle,
        totalExpense: transaction.typeId != 1 ? transaction.sum : 0,
        totalIncome: transaction.typeId == 1 ? transaction.sum : 0,
        totalOperation: 1,
      );
    }
  }

  return categoryDataMap.values.toList();
}
