import 'package:flutter/material.dart';

class AppTheme {
  static const Color urobilin = Color(0xffE1A815);

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: const Color(0xFFF4F3EF),
      fontFamily: 'OpenSans',
      colorScheme: const ColorScheme.light(
        primary: Colors.black,
        onPrimary: Colors.white,
        secondary: Color(0xFFE8A8A1),
        onSecondary: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black,
        error: Colors.redAccent,
        onError: Colors.white,
        brightness: Brightness.light,
      ),
    );
  }
}
