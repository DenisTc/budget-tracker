import 'package:bloc/bloc.dart';
import 'package:budget_tracker/src/feature/transaction/data/models/transaction_model.dart';
import 'package:budget_tracker/src/feature/transaction/domain/usecases/get_transactions.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'transaction_list_state.dart';

@singleton
class TransactionListCubit extends Cubit<TransactionListState> {
  final GetTransactionsUseCase _getTransactions;
  TransactionListCubit(GetTransactionsUseCase getTransactions)
      : _getTransactions = getTransactions,
        super(TransactionListLoading());

  Future<void> getTransactions({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    emit(TransactionListLoading());
    try {
      final result = await _getTransactions();
      emit(TransactionListLoadSuccess(result));
    } catch (e) {
      emit(TransactionListError());
    }
  }
}
