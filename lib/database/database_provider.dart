import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:przypominajka_flutter/utils/database_provider_helper.dart';

class DatabaseProvider {


  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async{
    if(_database != null)
      return _database;

    _database = await  initializeDatabase();
    return _database;
  }

  Future<Database> initializeDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'przypominajka.db'),
      version: 1,
      onCreate: _createDb
    );
  }


  void _createDb(Database db, int newVersion) async {
    Batch batch = db.batch();
    batch.execute(DatabaseProviderHelper.CREATE_EVENT_TABLE_STRING);
    List<dynamic> res = await batch.commit();
  }

}