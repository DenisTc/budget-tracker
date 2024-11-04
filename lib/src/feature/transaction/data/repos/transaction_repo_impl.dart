import 'package:budget_tracker/src/feature/transaction/data/datasource/transaction_local_data_source.dart';
import 'package:budget_tracker/src/feature/transaction/data/models/transaction_model.dart';
import 'package:budget_tracker/src/feature/transaction/domain/repos/transaction_repo.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  const TransactionRepositoryImpl(this._localDataSource);

  final TransactionLocalDataSource _localDataSource;

  @override
  Future<void> add(TransactionModel transaction) async =>
      _localDataSource.add(transaction);

  @override
  Future<List<TransactionModel>> getTransactions({
    DateTime? startDate,
    DateTime? endDate,
  }) async =>
      _localDataSource.getTransactions(
        startDate: startDate,
        endDate: endDate,
      );

  @override
  Future<void> remove(int id) async => _localDataSource.remove(id);

  @override
  Future<void> update(TransactionModel transaction) async =>
      _localDataSource.update(transaction);
}
