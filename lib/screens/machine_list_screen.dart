import 'package:flutter/material.dart';
import '../widgets/machine_card.dart';
import '../models/machine.dart';

class MachineListScreen extends StatelessWidget {
  const MachineListScreen({Key? key}) : super(key: key);

  // Dummy data for demonstration
  final List<Machine> machines = const [
    Machine(
      id: 1,
      modelName: 'Tractor X200',
      serialNumber: 'SN123456',
      purchaseDate: '2021-05-10',
      usageHours: 1200,
    ),
    Machine(
      id: 2,
      modelName: 'Harvester H300',
      serialNumber: 'SN654321',
      purchaseDate: '2022-01-22',
      usageHours: 800,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: machines.length,
        itemBuilder: (context, index) {
          return MachineCard(machine: machines[index]);
        },
      ),
    );
  }
}
