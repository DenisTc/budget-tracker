part of 'transaction_bloc.dart';

@immutable
sealed class TransactionEvent {}

class AddTransaction extends TransactionEvent {
  final TransactionModel transaction;

  AddTransaction(this.transaction);
}

class RemoveTransaction extends TransactionEvent {
  final int id;

  RemoveTransaction(this.id);
}

class UpdateTransaction extends TransactionEvent {
  final TransactionModel transaction;

  UpdateTransaction(this.transaction);
}
