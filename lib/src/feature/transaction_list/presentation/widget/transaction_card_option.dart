import 'package:budget_tracker/src/core/localization/generated/l10n.dart';
import 'package:budget_tracker/src/feature/transaction/presentation/cubit/transaction_cubit.dart';
import 'package:budget_tracker/src/feature/transaction_list/presentation/cubit/transaction_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionCardOption extends StatelessWidget {
  final int transactionId;
  const TransactionCardOption({super.key, required this.transactionId});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionCubit, TransactionState>(
      listener: (context, state) {
        if (state is TransactionRemoveSuccess) {
          context.read<TransactionListCubit>().getTransactions();
          Navigator.pop(context);
        }
      },
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ).copyWith(top: 24),
              child: ElevatedButton(
                onPressed: () {
                  //
                  context
                      .read<TransactionCubit>()
                      .removeTransaction(transactionId);
                },
                child: Text(S.of(context).deleteTransaction),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
