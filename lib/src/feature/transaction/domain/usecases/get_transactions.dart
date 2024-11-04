import 'package:budget_tracker/src/feature/transaction/data/models/transaction_model.dart';
import 'package:budget_tracker/src/feature/transaction/domain/repos/transaction_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTransactionsUseCase {
  final TransactionRepository _transactionRepository;

  GetTransactionsUseCase(this._transactionRepository);

  Future<List<TransactionModel>> call({
    DateTime? startDate,
    DateTime? endDate,
    int? categoryId,
    int? type,
  }) async =>
      _transactionRepository.getTransactions(
        startDate: startDate,
        endDate: endDate,
        categoryId: categoryId,
        type: type,
      );
}
