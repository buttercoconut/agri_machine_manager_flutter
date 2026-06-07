import 'package:flutter/material.dart';
import '../models/maintenance_record.dart';

class MaintenanceItem extends StatelessWidget {
  final MaintenanceRecord record;

  const MaintenanceItem({Key? key, required this.record}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.settings, color: Colors.orange),
      title: Text(record.description),
      subtitle: Text('Due: ${record.dueDate.toLocal().toShortDateString()}'),
    );
  }
}

extension DateTimeExtension on DateTime {
  String toShortDateString() => '${this.year}-${this.month.toString().padLeft(2, '0')}-${this.day.toString().padLeft(2, '0')}';
}
