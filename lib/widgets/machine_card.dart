import 'package:flutter/material.dart';
import '../models/machine.dart';

class MachineCard extends StatelessWidget {
  final Machine machine;

  const MachineCard({required this.machine, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Icon(
          machine.status == MachineStatus.operational
              ? Icons.check_circle
              : Icons.build,
          color: machine.status == MachineStatus.operational
              ? Colors.green
              : Colors.orange,
        ),
        title: Text(machine.name),
        subtitle: Text(
            'Last maintenance: ${_formatDate(machine.lastMaintenance)}'),
        trailing: Text(_statusText(machine.status)),
      ),
    );
  }

  String _statusText(MachineStatus status) {
    switch (status) {
      case MachineStatus.operational:
        return 'Operational';
      case MachineStatus.maintenance:
        return 'Maintenance';
      case MachineStatus.offline:
        return 'Offline';
    }
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}
