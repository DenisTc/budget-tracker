import 'package:budget_tracker/src/feature/transaction/data/models/transaction_model.dart';
import 'package:budget_tracker/src/feature/transaction/domain/repos/transaction_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateTransactionUseCase {
  final TransactionRepository _transactionRepository;

  UpdateTransactionUseCase(this._transactionRepository);

  Future<void> call(TransactionModel transaction) async =>
      _transactionRepository.update(transaction);
}
