import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBase {
  DataBase._();

  static DataBase database = DataBase._();
  static Database? db;
  initdb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'quotes.db');

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE IF NOT EXIST yourQuotes(id INTEGER PRIMARY KEY AUTOINCREMENT,quote TEXT,fontsize INTEGER,Bgimage BLOB,fullimage BLOB);");
        await db.execute(
            "CREATE TABLE IF NOT EXIST yourFavorite(id INTEGER PRIMARY KEY AUTOINCREMENT,quote TEXT,fontsize INTEGER,Bgimage BLOB,fullimage BLOB);");
        await db.execute(
            "CREATE TABLE IF NOT EXIST yourPublish(id INTEGER PRIMARY KEY AUTOINCREMENT,quote TEXT,fontsize INTEGER,Bgimage BLOB,fullimage BLOB);");
      },
    );
  }
}
