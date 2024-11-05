import 'package:flutter/material.dart';

class AppSizes {
  AppSizes._();

  static const p8 = 8.0;
  static const p16 = 16.0;
  static const p24 = 24.0;

  static SizedBox get gapW8 => const SizedBox(width: p8);

  static SizedBox get gapH8 => const SizedBox(height: p8);
  static SizedBox get gapH16 => const SizedBox(height: p16);
  static SizedBox get gapH24 => const SizedBox(height: p24);
}
