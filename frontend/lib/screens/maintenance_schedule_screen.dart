import 'package:flutter/material.dart';
import '../models/maintenance_record.dart';

class MaintenanceScheduleScreen extends StatelessWidget {
  const MaintenanceScheduleScreen({Key? key}) : super(key: key);

  // Dummy data
  final List<MaintenanceRecord> records = const [
    MaintenanceRecord(
      id: 1,
      machineId: 1,
      task: 'Oil Change',
      dueDate: '2024-07-15',
      status: 'Pending',
    ),
    MaintenanceRecord(
      id: 2,
      machineId: 2,
      task: 'Blade Sharpening',
      dueDate: '2024-08-01',
      status: 'Completed',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: records.length,
        itemBuilder: (context, index) {
          return MaintenanceItem(record: records[index]);
        },
      ),
    );
  }
}
