import 'package:ccb_app_visitas/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'shareds/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme, // Define o tema escuro
      home: const LoginScreen(),
    );
  }
}
