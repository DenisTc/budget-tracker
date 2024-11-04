part of 'transaction_list_cubit.dart';

sealed class TransactionListState extends Equatable {
  const TransactionListState();

  @override
  List<Object> get props => [];
}

final class TransactionListInitial extends TransactionListState {}

class TransactionListLoading extends TransactionListState {}

class TransactionListLoadSuccess extends TransactionListState {
  final List<TransactionModel> transactions;

  const TransactionListLoadSuccess(this.transactions);
}

class TransactionListError extends TransactionListState {}
