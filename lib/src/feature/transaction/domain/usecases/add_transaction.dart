import 'package:budget_tracker/src/feature/transaction/data/models/transaction_model.dart';
import 'package:budget_tracker/src/feature/transaction/domain/repos/transaction_repo.dart';

class AddTransactionUseCase {
  final TransactionRepository _transactionRepository;

  AddTransactionUseCase(this._transactionRepository);

  Future<void> call(TransactionModel transaction) async =>
      _transactionRepository.add(transaction);
}
