import 'package:flutter/material.dart';
import 'machine_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agri Machine Manager'),
      ),
      body: const MachineListScreen(),
    );
  }
}
