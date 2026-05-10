import 'package:flutter/material.dart';
import '../models/machine.dart';
import '../widgets/machine_card.dart';

class MachineListScreen extends StatefulWidget {
  const MachineListScreen({super.key});

  @override
  State<MachineListScreen> createState() => _MachineListScreenState();
}

class _MachineListScreenState extends State<MachineListScreen> {
  // In a real app this would come from an API
  final List<Machine> _machines = [
    Machine(
      id: '1',
      name: 'Tractor X200',
      status: MachineStatus.operational,
      lastMaintenance: DateTime.now().subtract(const Duration(days: 10)),
    ),
    Machine(
      id: '2',
      name: 'Harvester Y300',
      status: MachineStatus.maintenance,
      lastMaintenance: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Machine(
      id: '3',
      name: 'Sprayer Z150',
      status: MachineStatus.operational,
      lastMaintenance: DateTime.now().subtract(const Duration(days: 20)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Machine List'),
      ),
      body: ListView.builder(
        itemCount: _machines.length,
        itemBuilder: (context, index) {
          return MachineCard(machine: _machines[index]);
        },
      ),
    );
  }
}
