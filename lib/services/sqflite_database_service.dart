import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Database? db;
String dbName = "vault.db";

class SqfliteDatabaseService {
  Future<void> initializeSqfliteDatabase() async {
    var path = await getDatabasesPath();
    String databasesPath = join(path, dbName);

    db = await openDatabase(
      databasesPath,
      version: 1,
      onCreate: _onCreate,
      onConfigure: _onConfigure,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("""
    CREATE TABLE accounts (
      id INTEGER PRIMARY KEY,
      accountItemID TEXT NOT NULL,
      accountItemImage TEXT NOT NULL,
      accountItemName TEXT NOT NULL,
      accountItemUsername TEXT NOT NULL,
      accountItemPassword TEXT NOT NULL
    )
    """);
  }

  Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }
}
