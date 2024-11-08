import 'package:budget_tracker/src/core/database/app_database.dart';
import 'package:budget_tracker/src/feature/statistics/data/models/monthly_transaction_summary_model.dart';
import 'package:budget_tracker/src/feature/transaction/data/models/transaction_model.dart';
import 'package:injectable/injectable.dart';

abstract interface class TransactionLocalDataSource {
  Future<List<TransactionModel>> getTransactions({
    DateTime? startDate,
    DateTime? endDate,
    int? categoryId,
    int? type,
  });

  Future<List<MonthlyTransactionSummaryModel>> getStatistics();

  Future<void> add(TransactionModel transaction);

  Future<void> remove(int id);

  Future<void> update(TransactionModel transaction);
}

@LazySingleton(as: TransactionLocalDataSource)
class TransactionLocalDataSourceImpl implements TransactionLocalDataSource {
  final AppDatabase db;

  TransactionLocalDataSourceImpl(this.db);

  @override
  Future<void> add(TransactionModel transaction) async =>
      await db.transactionsDao.insertTransaction(transaction);

  @override
  Future<void> remove(int id) async => await db.transactionsDao.remove(id);

  @override
  Future<void> update(TransactionModel transaction) async {
    return await db.transactionsDao.updateTransaction(transaction);
  }

  @override
  Future<List<TransactionModel>> getTransactions({
    DateTime? startDate,
    DateTime? endDate,
    int? categoryId,
    int? type,
  }) async =>
      await db.transactionsDao.getTransactions(
        startDate: startDate,
        endDate: endDate,
        categoryId: categoryId,
        type: type,
      );

  @override
  Future<List<MonthlyTransactionSummaryModel>> getStatistics() async =>
      await db.transactionsDao.getTransactionStatistics();
}
