import 'package:budget_tracker/src/core/constant/app_text_input_formatters.dart';
import 'package:budget_tracker/src/core/extension/string_extension.dart';
import 'package:budget_tracker/src/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class SumOfTransaction extends StatelessWidget {
  const SumOfTransaction({
    super.key,
    required this.sumController,
  });

  final TextEditingController sumController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: S.of(context).sumOfTransaction,
      ),
      controller: sumController,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: AppTextInputFormatters.digitsWithDotOnly,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return S.of(context).pleaseEnterAmount;
        } else if (value.isNotNullOrEmpty &&
            double.tryParse(value ?? '0.0') == 0) {
          return S.of(context).pleaseEnterAmountGreaterThanZero;
        }
        return null;
      },
    );
  }
}
