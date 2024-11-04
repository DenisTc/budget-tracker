part of 'transaction_bloc.dart';

@immutable
sealed class TransactionState {}

final class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionAddSuccess extends TransactionState {}

class TransactionRemoveSuccess extends TransactionState {}

class TransactionUpdateSuccess extends TransactionState {}

class TransactionError extends TransactionState {}
