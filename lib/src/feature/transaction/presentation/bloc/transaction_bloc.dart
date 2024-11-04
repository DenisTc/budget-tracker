import 'package:bloc/bloc.dart';
import 'package:budget_tracker/src/feature/transaction/data/models/transaction_model.dart';
import 'package:budget_tracker/src/feature/transaction/domain/usecases/add_transaction.dart';
import 'package:budget_tracker/src/feature/transaction/domain/usecases/remove_transaction.dart';
import 'package:budget_tracker/src/feature/transaction/domain/usecases/update_transaction.dart';
import 'package:meta/meta.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final AddTransactionUseCase _addTransactionUseCase;
  final RemoveTransactionUseCase _removeTransactionUseCase;
  final UpdateTransactionUseCase _updateTransactionUseCase;

  TransactionBloc({
    required AddTransactionUseCase addTransactionUseCase,
    required RemoveTransactionUseCase removeTransactionUseCase,
    required UpdateTransactionUseCase updateTransactionUseCase,
  })  : _addTransactionUseCase = addTransactionUseCase,
        _removeTransactionUseCase = removeTransactionUseCase,
        _updateTransactionUseCase = updateTransactionUseCase,
        super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) {
      emit(TransactionLoading());
    });

    on<AddTransaction>(addTransaction);
    on<RemoveTransaction>(removeTransaction);
    on<UpdateTransaction>(updateTransaction);
  }

  Future<void> addTransaction(
    AddTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      await _addTransactionUseCase(event.transaction);
      emit(TransactionAddSuccess());
    } catch (e) {
      emit(TransactionError());
    }
  }

  Future<void> removeTransaction(
    RemoveTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      await _removeTransactionUseCase(event.id);
      emit(TransactionRemoveSuccess());
    } catch (e) {
      emit(TransactionError());
    }
  }

  Future<void> updateTransaction(
    UpdateTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      await _updateTransactionUseCase(event.transaction);
      emit(TransactionUpdateSuccess());
    } catch (e) {
      emit(TransactionError());
    }
  }
}
