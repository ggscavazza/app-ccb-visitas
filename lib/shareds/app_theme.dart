import 'package:flutter/material.dart';

class AppTheme {
  // Definição das cores Flat UI Colors China
  static const Color primaryColor = Color(0xFF2f3542); // Prestige Blue
  static const Color accentColor = Color(0xFFff4757); // Watermelon
  static const Color backgroundColor = Color(0xFF2f3542); // Prestige Blue
  static const Color cardColor = Color(0xFF1e90ff); // Clear Chill
  static const Color textColor = Colors.white;

  // Definição do tema escuro
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: textColor,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: textColor),
      bodyMedium: TextStyle(fontSize: 16, color: textColor),
    ),
    cardColor: cardColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(accentColor),
        foregroundColor: WidgetStatePropertyAll(textColor),
      ),
    ),
  );
}
