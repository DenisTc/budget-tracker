import 'package:budget_tracker/src/core/extension/datetime_extension.dart';
import 'package:budget_tracker/src/core/localization/generated/l10n.dart';
import 'package:budget_tracker/src/feature/category/data/models/category.dart';
import 'package:budget_tracker/src/feature/transaction/data/models/transaction_model.dart';
import 'package:budget_tracker/src/feature/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTransactionButton extends StatelessWidget {
  const AddTransactionButton({
    super.key,
    required this.categoryController,
    required this.typeController,
    required this.formKey,
    required this.sumController,
    required this.dateController,
  });

  final ValueNotifier<CategoryModel?> categoryController;
  final ValueNotifier<int?> typeController;
  final GlobalKey<FormState> formKey;
  final TextEditingController sumController;
  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocListener<TransactionBloc, TransactionState>(
        listener: (context, state) {
          if (state is TransactionAddSuccess) {
            // TODO: Добавить обновление списка транзакций
            Navigator.pop(context);
          }
        },
        child: ElevatedButton(
          onPressed: () {
            final category = categoryController.value;
            final typeId = typeController.value;
            final isValidForm = formKey.currentState!.validate() &&
                category != null &&
                typeId != null;

            if (isValidForm) {
              final transaction = TransactionModel(
                id: 0,
                typeId: typeController.value ?? 0,
                sum: double.parse(sumController.value.text),
                category: CategoryModel(id: category.id, title: category.title),
                date: DateTimeExtension.fromStringFormat(
                      dateController.text,
                    ) ??
                    DateTime.now(),
              );

              context.read<TransactionBloc>().add(AddTransaction(transaction));
            }
          },
          child: Text(
            S.of(context).add,
          ),
        ),
      ),
    );
  }
}