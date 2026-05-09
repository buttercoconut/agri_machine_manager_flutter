class Machine {
  final int id;
  final String modelName;
  final String serialNumber;
  final String purchaseDate;
  final int usageHours;

  const Machine({
    required this.id,
    required this.modelName,
    required this.serialNumber,
    required this.purchaseDate,
    required this.usageHours,
  });

  factory Machine.fromJson(Map<String, dynamic> json) {
    return Machine(
      id: json['id'],
      modelName: json['modelName'],
      serialNumber: json['serialNumber'],
      purchaseDate: json['purchaseDate'],
      usageHours: json['usageHours'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'modelName': modelName,
        'serialNumber': serialNumber,
        'purchaseDate': purchaseDate,
        'usageHours': usageHours,
      };
}
