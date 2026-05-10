import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/machine.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<List<Machine>> fetchMachines() async {
    final response = await http.get(Uri.parse('$baseUrl/machines'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => _machineFromJson(e)).toList();
    } else {
      throw Exception('Failed to load machines');
    }
  }

  Machine _machineFromJson(Map<String, dynamic> json) {
    return Machine(
      id: json['id'] as String,
      name: json['name'] as String,
      status: _statusFromString(json['status'] as String),
      lastMaintenance: DateTime.parse(json['lastMaintenance'] as String),
    );
  }

  MachineStatus _statusFromString(String status) {
    switch (status.toLowerCase()) {
      case 'operational':
        return MachineStatus.operational;
      case 'maintenance':
        return MachineStatus.maintenance;
      case 'offline':
        return MachineStatus.offline;
      default:
        return MachineStatus.offline;
    }
  }
}
