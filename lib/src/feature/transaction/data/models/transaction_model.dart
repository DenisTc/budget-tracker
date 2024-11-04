import 'package:budget_tracker/src/feature/transaction/domain/entities/transaction.dart';

class TransactionModel extends Transaction {
  const TransactionModel({
    required super.id,
    required super.sum,
    required super.typeId,
    required super.category,
    required super.date,
  });
}
