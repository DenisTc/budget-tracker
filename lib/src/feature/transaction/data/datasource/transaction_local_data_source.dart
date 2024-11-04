import 'package:budget_tracker/src/core/database/app_database.dart';
import 'package:budget_tracker/src/feature/transaction/data/models/transaction_model.dart';

abstract interface class TransactionLocalDataSource {
  Future<List<TransactionModel>> getTransactions({
    DateTime? startDate,
    DateTime? endDate,
  });

  Future<void> add(TransactionModel transaction);

  Future<void> remove(int id);

  Future<void> update(TransactionModel transaction);
}

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
  }) async =>
      await db.transactionsDao.getTransactions(
        startDate: startDate,
        endDate: endDate,
      );
}
