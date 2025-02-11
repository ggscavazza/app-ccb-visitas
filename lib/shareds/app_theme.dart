import 'package:flutter/material.dart';

class AppTheme {
  // Definição das cores Flat UI Colors Reino Unido
  static const Color primaryColor =
      Color(0xFF2f3640); // Preto - Electromagnetic
  static const Color accentColor =
      Color(0xFFc23616); // Vermelho - Harley Davidson Orange
  static const Color backgroundColor = Color(0xFF202020); // Preto falso
  static const Color cardColor = Color(0xFF0097e6); // Azul - Vanadyl Blue
  static const Color textColor = Color(0xFFf5f6fa); // Branco - Lynx White

  static const Color blueColor = Color(0xFF00a8ff) // Azul - Protoss Pylon
  static const Color purpleColor = Color(0xFF9c88ff) // Roxo - Periwinkle
  static const Color darkPurpleColor = Color(0xFF8c7ae6) // Roxo - Matt Purple
  static const Color yellowColor = Color(0xFFfbc531) // Amarelo - Rise And Shine
  static const Color darkYellowColor = Color(0xFFe1b12c) // Amarelo - Nanohanacha Gold
  static const Color greenColor = Color(0xFF4cd137) // Verde - Download Progress
  static const Color darkGreenColor = Color(0xFF44bd32) // Verde - Skirret Green
  static const Color blueGrayColor = Color(0xFF487eb0) // Cinza Azulado - Seabrook
  static const Color darkBlueGrayColor = Color(0xFF40739e) // Cinza Azulado - Naval
  static const Color redColor = Color(0xFFe84118) // Vermelho - Nasturcian Flower
  static const Color darkWhiteColor = Color(0xFFdcdde1) // Branco Gelo - Hint Of Pensive
  static const Color grayColor = Color(0xFF7f8fa6) // Cinza - Blueberry Soda
  static const Color darkGrayColor = Color(0xFF718093) // Cinza - Cahin Gang Grey
  static const Color marineBlueColor = Color(0xFF273c75) // Azul Marinho - Mazarine Blue
  static const Color darkMarineBlueColor = Color(0xFF192a56) // Azul Marinho - Pico Void
  static const Color blackColor = Color(0xFF353b48) // Preto - Blue Nights

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
