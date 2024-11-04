import 'package:bloc/bloc.dart';
import 'package:budget_tracker/src/feature/transaction/data/models/transaction_model.dart';
import 'package:budget_tracker/src/feature/transaction/domain/usecases/add_transaction.dart';
import 'package:budget_tracker/src/feature/transaction/domain/usecases/remove_transaction.dart';
import 'package:budget_tracker/src/feature/transaction/domain/usecases/update_transaction.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'transaction_state.dart';

@singleton
class TransactionCubit extends Cubit<TransactionState> {
  final AddTransactionUseCase _addTransaction;
  final RemoveTransactionUseCase _removeTransaction;
  final UpdateTransactionUseCase _updateTransaction;
  TransactionCubit({
    required AddTransactionUseCase addTransaction,
    required RemoveTransactionUseCase removeTransaction,
    required UpdateTransactionUseCase updateTransaction,
  })  : _addTransaction = addTransaction,
        _removeTransaction = removeTransaction,
        _updateTransaction = updateTransaction,
        super(TransactionInitial());

  Future<void> addTransaction(TransactionModel transaction) async {
    emit(TransactionLoading());
    try {
      await _addTransaction(transaction);
      emit(TransactionAddSuccess());
    } catch (e) {
      emit(TransactionError());
    }
  }

  Future<void> removeTransaction(int id) async {
    emit(TransactionLoading());
    try {
      await _removeTransaction(id);
      emit(TransactionRemoveSuccess());
    } catch (e) {
      emit(TransactionError());
    }
  }

  Future<void> updateTransaction(TransactionModel transaction) async {
    emit(TransactionLoading());
    try {
      await _updateTransaction(transaction);
      emit(TransactionUpdateSuccess());
    } catch (e) {
      emit(TransactionError());
    }
  }
}
