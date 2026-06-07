class MaintenanceRecord {
  final String id;
  final String machineId;
  final String description;
  final DateTime dueDate;

  MaintenanceRecord({
    required this.id,
    required this.machineId,
    required this.description,
    required this.dueDate,
  });

  factory MaintenanceRecord.fromJson(Map<String, dynamic> json) {
    return MaintenanceRecord(
      id: json['id'] as String,
      machineId: json['machineId'] as String,
      description: json['description'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
    );
  }

  factory MaintenanceRecord.fromMap(Map<String, dynamic> map) {
    return MaintenanceRecord(
      id: map['id'] as String,
      machineId: map['machineId'] as String,
      description: map['description'] as String,
      dueDate: DateTime.parse(map['dueDate'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'machineId': machineId,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
    };
  }
}
