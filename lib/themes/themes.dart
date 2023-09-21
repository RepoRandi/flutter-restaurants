import 'package:flutter/material.dart';

class RestaurantTheme {
  static const primaryColor = Color(0xFFB71C1C);
  static const secondaryColor = Color(0xFFD32F2F);
  static const accentColor = Color(0xFFFFC107);

  static final lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      titleTextStyle: TextStyle(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: secondaryColor,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primaryColor),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
  );
}
