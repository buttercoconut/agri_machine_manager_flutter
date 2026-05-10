import 'package:flutter/material.dart';
import 'screens/machine_list_screen.dart';

void main() {
  runApp(const AgriMachineManagerApp());
}

class AgriMachineManagerApp extends StatelessWidget {
  const AgriMachineManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agri Machine Manager',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MachineListScreen(),
    );
  }
}
