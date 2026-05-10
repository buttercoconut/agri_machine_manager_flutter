enum MachineStatus {
  operational,
  maintenance,
  offline,
}

class Machine {
  final String id;
  final String name;
  final MachineStatus status;
  final DateTime lastMaintenance;

  Machine(
      {required this.id,
      required this.name,
      required this.status,
      required this.lastMaintenance});
}
