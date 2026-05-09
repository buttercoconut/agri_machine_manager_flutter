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
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'agri_manager.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE machines(
        id INTEGER PRIMARY KEY,
        modelName TEXT,
        serialNumber TEXT,
        purchaseDate TEXT,
        usageHours INTEGER
      );
    ''');
    await db.execute('''
      CREATE TABLE maintenance_records(
        id INTEGER PRIMARY KEY,
        machineId INTEGER,
        task TEXT,
        dueDate TEXT,
        status TEXT,
        FOREIGN KEY(machineId) REFERENCES machines(id)
      );
    ''');
  }

  // CRUD methods for machines and maintenance records can be added here
}
