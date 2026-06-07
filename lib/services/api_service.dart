import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/machine.dart';
import '../models/maintenance_record.dart';

class ApiService {
  static const String _baseUrl = 'https://api.example.com';

  static Future<List<Machine>> getMachines() async {
    final response = await http.get(Uri.parse('$_baseUrl/machines'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Machine.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load machines');
    }
  }

  static Future<List<MaintenanceRecord>> getMaintenanceRecords(String machineId) async {
    final response = await http.get(Uri.parse('$_baseUrl/machines/$machineId/maintenance'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => MaintenanceRecord.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load maintenance records');
    }
  }
}
