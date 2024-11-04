import 'package:budget_tracker/src/core/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:budget_tracker/src/core/extension/datetime_extension.dart';

class DateOfTransaction extends StatefulWidget {
  const DateOfTransaction({
    super.key,
    required this.dateController,
  });

  final TextEditingController dateController;

  @override
  State<DateOfTransaction> createState() => _DateOfTransactionState();
}

class _DateOfTransactionState extends State<DateOfTransaction> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dateController,
      readOnly: true,
      keyboardType: TextInputType.datetime,
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
        labelText: S.of(context).selectDate,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () => _selectDate(context),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).pleaseSelectDate;
        }
        return null;
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    FocusScope.of(context).focusedChild?.unfocus();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        widget.dateController.text = picked.toStringFormat();
      });
    }
  }
}
