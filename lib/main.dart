import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AgriMachineManagerApp());
}

class AgriMachineManagerApp extends StatelessWidget {
  const AgriMachineManagerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agri Machine Manager',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}
