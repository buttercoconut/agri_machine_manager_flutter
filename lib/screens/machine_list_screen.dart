import 'package:flutter/material.dart';
import '../widgets/machine_card.dart';
import '../models/machine.dart';
import '../services/api_service.dart';

class MachineListScreen extends StatefulWidget {
  const MachineListScreen({Key? key}) : super(key: key);

  @override
  State<MachineListScreen> createState() => _MachineListScreenState();
}

class _MachineListScreenState extends State<MachineListScreen> {
  List<Machine> _machines = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchMachines();
  }

  Future<void> _fetchMachines() async {
    final machines = await ApiService.getMachines();
    setState(() {
      _machines = machines;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemCount: _machines.length,
      itemBuilder: (context, index) {
        return MachineCard(machine: _machines[index]);
      },
    );
  }
}
