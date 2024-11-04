part of 'transaction_cubit.dart';

sealed class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

final class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionAddSuccess extends TransactionState {}

class TransactionRemoveSuccess extends TransactionState {}

class TransactionUpdateSuccess extends TransactionState {}

class TransactionError extends TransactionState {}
