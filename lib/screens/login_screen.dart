import 'package:ccb_app_visitas/screens/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import '../shareds/app_theme.dart'; // Importando o tema corretamente

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedComum;
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  List<String> comuns = ["Carregando..."]; // Lista temporária antes da API

  @override
  void initState() {
    super.initState();
    _fetchComuns();
  }

  Future<void> _fetchComuns() async {
    // Simulação de API - Substituir por chamada real
    // TODO Criar chamada real da API que Retornará as Comuns
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      comuns = ["Comum 1", "Comum 2", "Comum 3"]; // Dados da API
      selectedComum = comuns.first;
    });
  }

  bool _isPasswordValid(String password) {
    final regex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@\$!%*?&])[A-Za-z\d@\$!%*?&]{8,}\$');
    return regex.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          FocusScope.of(context).unfocus(), // Fecha o teclado ao tocar fora
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor, // Cor de fundo do tema
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo Centralizado
                    Container(
                      height: 250,
                      width: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/splash_logo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Campos de Login
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.blackColor.withAlpha(
                            50), // Fundo do card com transparência ajustada
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          DropdownButtonFormField<String>(
                            value: selectedComum,
                            items: comuns.map((comum) {
                              return DropdownMenuItem(
                                  value: comum, child: Text(comum));
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedComum = value;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Comum',
                              prefixIcon: const Icon(Icons.roofing,
                                  color: AppTheme.grayColor),
                              filled: true,
                              fillColor: AppTheme.blackColor.withAlpha(38),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: AppTheme.grayColor),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: userController,
                            decoration: InputDecoration(
                              labelText: 'Usuário',
                              labelStyle:
                                  const TextStyle(color: AppTheme.textColor),
                              prefixIcon: const Icon(Icons.person_outline,
                                  color: AppTheme.grayColor),
                              filled: true,
                              fillColor: AppTheme.blackColor.withAlpha(38),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: AppTheme.grayColor),
                              ),
                            ),
                            style: const TextStyle(color: AppTheme.textColor),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              labelStyle:
                                  const TextStyle(color: AppTheme.textColor),
                              prefixIcon: _obscurePassword
                                  ? const Icon(Icons.lock_outline,
                                      color: AppTheme.grayColor)
                                  : const Icon(Icons.lock_open,
                                      color: AppTheme.grayColor),
                              filled: true,
                              fillColor: AppTheme.blackColor.withAlpha(38),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: AppTheme.grayColor),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                            validator: (value) => (value == null ||
                                    !_isPasswordValid(value))
                                ? 'Senha inválida: 8 caracteres, 1 maiúscula, 1 número e 1 especial'
                                : null,
                            style: const TextStyle(color: AppTheme.textColor),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordScreen()),
                              );
                            },
                            style: TextButton.styleFrom(
                              alignment: Alignment
                                  .centerLeft, // Alinha o conteúdo à esquerda
                            ),
                            child: const Align(
                              alignment: Alignment
                                  .centerLeft, // Garante alinhamento total à esquerda
                              child: Text(
                                'Esqueceu sua senha?',
                                style: TextStyle(color: AppTheme.redColor),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Botão de Login
                          ElevatedButton(
                            onPressed: () {
                              // TODO Lógica de Login
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme
                                  .buttonColor, // Cor de destaque (vermelho)
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Entrar',
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
