class MaintenanceRecord {
  final int id;
  final int machineId;
  final String task;
  final String dueDate;
  final String status;

  const MaintenanceRecord({
    required this.id,
    required this.machineId,
    required this.task,
    required this.dueDate,
    required this.status,
  });

  factory MaintenanceRecord.fromJson(Map<String, dynamic> json) {
    return MaintenanceRecord(
      id: json['id'],
      machineId: json['machineId'],
      task: json['task'],
      dueDate: json['dueDate'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'machineId': machineId,
        'task': task,
        'dueDate': dueDate,
        'status': status,
      };
}
