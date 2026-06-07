class Machine {
  final String id;
  final String modelName;
  final String serialNumber;
  final DateTime purchaseDate;
  final int hoursUsed;

  Machine({
    required this.id,
    required this.modelName,
    required this.serialNumber,
    required this.purchaseDate,
    required this.hoursUsed,
  });

  factory Machine.fromJson(Map<String, dynamic> json) {
    return Machine(
      id: json['id'] as String,
      modelName: json['modelName'] as String,
      serialNumber: json['serialNumber'] as String,
      purchaseDate: DateTime.parse(json['purchaseDate'] as String),
      hoursUsed: json['hoursUsed'] as int,
    );
  }

  factory Machine.fromMap(Map<String, dynamic> map) {
    return Machine(
      id: map['id'] as String,
      modelName: map['modelName'] as String,
      serialNumber: map['serialNumber'] as String,
      purchaseDate: DateTime.parse(map['purchaseDate'] as String),
      hoursUsed: map['hoursUsed'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'modelName': modelName,
      'serialNumber': serialNumber,
      'purchaseDate': purchaseDate.toIso8601String(),
      'hoursUsed': hoursUsed,
    };
  }
}
