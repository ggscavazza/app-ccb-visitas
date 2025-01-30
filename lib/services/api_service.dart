import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  static const String _baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse("$_baseUrl/users"));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception("Erro ao buscar usuários");
    }
  }
}
