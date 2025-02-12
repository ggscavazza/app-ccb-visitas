import 'package:ccb_app_visitas/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../shareds/app_theme.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          FocusScope.of(context).unfocus(), // Fecha o teclado ao tocar fora
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor, // Fundo do app
        appBar: AppBar(
          backgroundColor: AppTheme.primaryColor,
          title: const Text('Recuperar Senha',
              style: TextStyle(color: AppTheme.textColor)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppTheme.textColor),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Digite seu e-mail para recuperar sua senha:',
                    style: TextStyle(color: AppTheme.textColor, fontSize: 16),
                  ),
                  const SizedBox(height: 20),

                  // Campo de e-mail
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      labelStyle: const TextStyle(color: AppTheme.textColor),
                      prefixIcon: const Icon(Icons.email_outlined,
                          color: AppTheme.grayColor),
                      filled: true,
                      fillColor: AppTheme.blackColor.withAlpha(38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppTheme.grayColor),
                      ),
                    ),
                    style: const TextStyle(color: AppTheme.textColor),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite seu e-mail';
                      }
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegex.hasMatch(value)) {
                        return 'E-mail inválido';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Botão de recuperação
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // TODO Lógica de recuperação de senha será adicionada futuramente
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.buttonColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Recuperar',
                      style: TextStyle(
                        color: AppTheme.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
