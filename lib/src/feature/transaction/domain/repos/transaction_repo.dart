import 'package:budget_tracker/src/feature/transaction/data/models/transaction_model.dart';

abstract interface class TransactionRepository {
  Future<List<TransactionModel>> getTransactions({
    DateTime? startDate,
    DateTime? endDate,
  });

  Future<void> add(TransactionModel transaction);

  Future<void> update(TransactionModel transaction);

  Future<void> remove(int id);
}
