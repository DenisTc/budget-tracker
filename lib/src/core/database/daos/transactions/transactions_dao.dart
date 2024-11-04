import 'package:budget_tracker/src/core/database/app_database.dart';
import 'package:budget_tracker/src/core/database/tables/transactions.dart';
import 'package:budget_tracker/src/feature/category/data/models/category.dart';
import 'package:budget_tracker/src/feature/transaction/data/models/transaction_model.dart';
import 'package:drift/drift.dart';

part 'transactions_dao.g.dart';

@DriftAccessor(
  tables: [TransactionsDataModel],
)
class TransactionsDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionsDaoMixin {
  TransactionsDao(super.db);

  // Future<List<Transaction>> getTransactions({
  //   DateTime? startDate,
  //   DateTime? endDate,
  // }) async {
  //   final query = select(transactionsDataModel);

  //   if (startDate != null || endDate != null) {
  //     if (startDate != null) {
  //       query.where((tbl) => tbl.date.isBiggerOrEqualValue(startDate));
  //     }

  //     if (endDate != null) {
  //       query.where((tbl) => tbl.date.isSmallerOrEqualValue(endDate));
  //     }
  //   }

  //   query.orderBy([
  //     (tbl) => OrderingTerm(expression: tbl.date, mode: OrderingMode.desc),
  //   ]);

  //   final items = await query.get();

  //   return items.map((item) => item.toGetTransaction()).toList();
  // }

  Future<List<TransactionModel>> getTransactions({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final query = select(transactionsDataModel);

    if (startDate != null || endDate != null) {
      if (startDate != null) {
        query.where((tbl) => tbl.date.isBiggerOrEqualValue(startDate));
      }

      if (endDate != null) {
        query.where((tbl) => tbl.date.isSmallerOrEqualValue(endDate));
      }
    }

    query.orderBy([
      (tbl) => OrderingTerm(expression: tbl.date, mode: OrderingMode.desc),
    ]);

    final items = await query.get();

    final categories = await select(categoriesDataModel).get();

    final categoryMap = {
      for (var category in categories) category.id: category
    };

    return items.map((item) {
      final category = categoryMap[item.categoryId];
      return TransactionModel(
        id: item.id,
        sum: item.sum,
        typeId: item.typeId,
        date: item.date,
        category: CategoryModel(
          id: category?.id ?? 0,
          title: category?.title ?? '',
        ),
      );
    }).toList();
  }

  Future<void> insert(TransactionModel transaction) async {
    await into(transactionsDataModel).insert(
      transaction.toInsertTransaction(),
    );
  }

  Future<void> remove(int id) async {
    await (delete(transactionsDataModel)..where((c) => c.id.equals(id))).go();
  }

  Future<void> insertTransaction(TransactionModel transaction) async {
    await into(transactionsDataModel).insert(transaction.toInsertTransaction());
  }

  Future<void> updateTransaction(TransactionModel transaction) async {
    await (update(transactionsDataModel)
          ..where((tbl) => tbl.id.equals(transaction.id)))
        .write(transaction.toInsertTransaction());
  }
}

extension on TransactionModel {
  TransactionsDataModelCompanion toInsertTransaction() {
    return TransactionsDataModelCompanion(
      sum: Value(sum),
      typeId: Value(typeId),
      categoryId: Value(category.id),
      date: Value(date),
      id: const Value.absent(),
    );
  }
}
