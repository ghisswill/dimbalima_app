import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'htpp://10.0.2.2:8080';

  Future<List<String>> fetchTodos() async {
    final response = await http.get(Uri.parse('$baseUrl/api/todos'));

    if (response == 200) {
      final List data = jsonDecode(response.body);
      return data.cast<String>();
    } else {
      throw Exception("Erreur API");
    }
  }
}
