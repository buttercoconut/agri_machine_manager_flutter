import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/machine.dart';
import '../models/maintenance_record.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'agri_machine_manager.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE machines(
        id TEXT PRIMARY KEY,
        modelName TEXT,
        serialNumber TEXT,
        purchaseDate TEXT,
        hoursUsed INTEGER
      );
    ''');
    await db.execute('''
      CREATE TABLE maintenance_records(
        id TEXT PRIMARY KEY,
        machineId TEXT,
        description TEXT,
        dueDate TEXT,
        FOREIGN KEY(machineId) REFERENCES machines(id)
      );
    ''');
  }

  Future<void> insertMachine(Machine machine) async {
    final db = await database;
    await db.insert('machines', machine.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> insertMaintenanceRecord(MaintenanceRecord record) async {
    final db = await database;
    await db.insert('maintenance_records', record.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Machine>> getMachines() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('machines');
    return List.generate(maps.length, (i) => Machine.fromMap(maps[i]));
  }

  Future<List<MaintenanceRecord>> getMaintenanceRecords(String machineId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'maintenance_records',
      where: 'machineId = ?',
      whereArgs: [machineId],
    );
    return List.generate(maps.length, (i) => MaintenanceRecord.fromMap(maps[i]));
  }
}
