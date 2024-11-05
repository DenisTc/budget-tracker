import 'package:budget_tracker/src/core/constant/app_sizes.dart';
import 'package:budget_tracker/src/core/enums/operation_type.dart';
import 'package:budget_tracker/src/core/localization/generated/l10n.dart';
import 'package:budget_tracker/src/feature/transaction_list/presentation/cubit/transaction_list_cubit.dart';
import 'package:budget_tracker/src/feature/transaction_list/presentation/filter_transaction_list_screen.dart';
import 'package:budget_tracker/src/feature/transaction_list/presentation/widgets/transaction_card_option.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:budget_tracker/src/core/extension/datetime_extension.dart';

class TransactionListScreen extends StatefulWidget {
  const TransactionListScreen({super.key});

  @override
  State<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TransactionListCubit>().getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).yourTransactions),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FilterTransactionListScreen(),
                ),
              );
            },
            icon: BlocBuilder<TransactionListCubit, TransactionListState>(
              builder: (context, state) {
                return Badge(
                  isLabelVisible:
                      context.read<TransactionListCubit>().isHasFilters,
                  smallSize: 10,
                  child: const Icon(Icons.tune),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          AppSizes.gapH8,
          BlocBuilder<TransactionListCubit, TransactionListState>(
            builder: (context, state) {
              if (state is TransactionListLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TransactionListLoadSuccess) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = state.transactions[index];
                      final date = transaction.date.toStringFormat();
                      final isExpense =
                          transaction.typeId == OperationTypeEnum.expense.value;
                      return GestureDetector(
                        onTap: () => showModalBottomSheet(
                          context: context,
                          useSafeArea: true,
                          builder: (_) => TransactionCardOption(
                            transactionId: transaction.id,
                          ),
                        ),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(S.of(context).dateNdate(date)),
                                    Text(
                                      '${isExpense ? '-' : '+'} ${transaction.sum.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: isExpense
                                            ? Colors.red
                                            : Colors.green,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Text(
                                    '${S.of(context).category}: ${transaction.category.title}'),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
