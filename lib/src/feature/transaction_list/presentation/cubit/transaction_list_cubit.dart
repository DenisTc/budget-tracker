import 'package:bloc/bloc.dart';
import 'package:budget_tracker/src/feature/transaction/data/models/transaction_model.dart';
import 'package:budget_tracker/src/feature/transaction/domain/usecases/get_transactions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'transaction_list_state.dart';

@singleton
class TransactionListCubit extends Cubit<TransactionListState> {
  final GetTransactionsUseCase _getTransactions;

  bool isHasFilters = false;
  DateTimeRange? selectedDateRange;
  int? selectedCategoryId;
  int? selectedType;

  TransactionListCubit(GetTransactionsUseCase getTransactions)
      : _getTransactions = getTransactions,
        super(TransactionListLoading());

  Future<void> getTransactions({
    DateTime? startDate,
    DateTime? endDate,
    int? categoryId,
    int? type,
  }) async {
    emit(TransactionListLoading());

    _updateFilters(
      startDate: startDate,
      endDate: endDate,
      categoryId: categoryId,
      type: type,
    );

    try {
      final result = await _getTransactions(
        startDate: startDate,
        endDate: endDate,
        categoryId: categoryId,
        type: type,
      );
      emit(TransactionListLoadSuccess(result));
    } catch (e) {
      emit(TransactionListError());
    }
  }

  void _updateFilters({
    DateTime? startDate,
    DateTime? endDate,
    int? categoryId,
    int? type,
  }) {
    if ((startDate != null && endDate != null) ||
        categoryId != null ||
        type != null) {
      selectedDateRange = (startDate != null && endDate != null)
          ? DateTimeRange(start: startDate, end: endDate)
          : null;
      selectedCategoryId = categoryId;
      selectedType = type;
      isHasFilters = true;
    } else {
      clearFilters();
    }
  }

  void clearFilters() {
    isHasFilters = false;
    selectedDateRange = null;
    selectedCategoryId = null;
    selectedType = null;
  }
}
