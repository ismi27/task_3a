import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'model_pegawai.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  final String tablePegawai = 'noteTable';
  final String columId = 'id';
  final String columnFirstName = 'firstname';
  final String columnLastName = 'lastname';
  final String columnMobileNo = 'mobileno';
  final String columnEmailId = 'emailid';
  final String columnPosition = 'position';
  final String columnDivision = 'division';
  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'pegawai.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newViersion) async {
    await db.execute(
        'CREATE TABLE $tablePegawai($columId INTEGER PRIMARY KEY, $columnFirstName TEXT, $columnLastName TEXT,$columnMobileNo TEXT, $columnEmailId TEXT, $columnPosition TEXT, $columnDivision TEXT)');
  }

  Future<int> savePegawai(ModelPegawai pegawai) async {
    var dbClient = await db;
    var result = await dbClient.insert(tablePegawai, pegawai.toMap());
    return result;
  }

  Future<List> getAllPegawai() async {
    var dbClient = await db;
    var result = await dbClient.query(tablePegawai, columns: [
      columId,
      columnFirstName,
      columnLastName,
      columnMobileNo,
      columnEmailId,
      columnPosition,
      columnDivision,
    ]);
    return result.toList();
  }
  Future<int> updatePegawai(ModelPegawai pegawai) async {
    var dbClient = await db;
    return await dbClient.update(tablePegawai, pegawai.toMap(),
        where: "$columId = ?", whereArgs: [pegawai.id]);
  }
  Future<int> deletePegawai(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tablePegawai, where: "$columId = ?", whereArgs: [id]);
  }
}
