import 'package:flutter/material.dart';
import '../models/maintenance_record.dart';

class MaintenanceItem extends StatelessWidget {
  final MaintenanceRecord record;

  const MaintenanceItem({Key? key, required this.record}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.build_circle, color: Colors.orange),
      title: Text(record.task),
      subtitle: Text('Due: ${record.dueDate}'),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
