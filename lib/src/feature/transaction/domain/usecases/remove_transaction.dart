import 'package:budget_tracker/src/feature/transaction/domain/repos/transaction_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoveTransactionUseCase {
  final TransactionRepository _transactionRepository;

  RemoveTransactionUseCase(this._transactionRepository);

  Future<void> call(int id) async => _transactionRepository.remove(id);
}
