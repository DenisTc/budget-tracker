import 'package:flutter/services.dart';

class AppTextInputFormatters {
  static final digitsWithDotOnly = [
    FilteringTextInputFormatter.allow(RegExp(r'^\d+[.,]?\d{0,2}')),
    TextInputFormatter.withFunction(
      (oldValue, newValue) => newValue.copyWith(
        text: newValue.text.replaceAll(',', '.'),
      ),
    ),
  ];
}
