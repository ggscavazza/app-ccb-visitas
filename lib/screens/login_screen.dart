import 'package:flutter/material.dart';
import '../shareds/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedComum;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  List<String> comuns = ["Carregando..."]; // Lista temporária antes da API

  @override
  void initState() {
    super.initState();
    _fetchComuns();
  }

  Future<void> _fetchComuns() async {
    // Simulação de API - Substituir por chamada real
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
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Center(
                child: Image.asset(
                  'assets/splash_logo.png', // Substituir pelo caminho correto do logo
                  height: 100,
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedComum,
                items: comuns.map((comum) {
                  return DropdownMenuItem(value: comum, child: Text(comum));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedComum = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Comum',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => (value == null || !value.contains('@'))
                    ? 'Digite um e-mail válido'
                    : null,
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
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
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Esqueci minha senha'),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.blueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Implementar login
                    }
                  },
                  child: Text('Entrar', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
