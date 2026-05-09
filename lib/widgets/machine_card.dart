import 'package:flutter/material.dart';
import '../models/machine.dart';

class MachineCard extends StatelessWidget {
  final Machine machine;

  const MachineCard({Key? key, required this.machine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.build, color: Colors.green),
        title: Text(machine.modelName),
        subtitle: Text('SN: ${machine.serialNumber}\nUsage: ${machine.usageHours} hrs'),
        isThreeLine: true,
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigate to detail screen (not implemented yet)
        },
      ),
    );
  }
}
