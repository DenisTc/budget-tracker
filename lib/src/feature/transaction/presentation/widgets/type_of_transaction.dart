import 'package:budget_tracker/src/core/enums/operation_type_enum.dart';
import 'package:budget_tracker/src/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class TypeOfTransaction extends StatelessWidget {
  const TypeOfTransaction({
    super.key,
    required this.typeController,
  });

  final ValueNotifier<int?> typeController;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: typeController.value,
      decoration: InputDecoration(
        labelText: S.of(context).typeOfTransaction,
      ),
      borderRadius: BorderRadius.circular(15),
      onChanged: (value) => typeController.value = value ?? 0,
      items: [
        DropdownMenuItem(
          value: OperationTypeEnum.expense.value,
          child: Text(S.of(context).expense),
        ),
        DropdownMenuItem(
          value: OperationTypeEnum.income.value,
          child: Text(S.of(context).income),
        ),
      ],
      validator: (value) {
        if (value == null) {
          return S.of(context).pleaseSelectTransactionType;
        }
        return null;
      },
    );
  }
}
