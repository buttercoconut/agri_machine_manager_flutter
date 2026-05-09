import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://api.example.com';

  Future<http.Response> getMachines() async {
    final url = Uri.parse('$baseUrl/machines');
    return await http.get(url);
  }

  // Add more API methods as needed
}
