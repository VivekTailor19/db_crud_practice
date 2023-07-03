import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DB_helper {
  Database? database;

  final String dbPath = "dbase.db";

  Future<Database?> createDB()
  async {
    if(database != null)
      {
        return database;
      }
    else
      {
         return await initDB();
      }
  }

  Future<Database> initDB()
  async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(await getDatabasesPath(), dbPath);

    return await openDatabase(path,
        version: 1,
        onCreate: (db, version) async {
         return await db.execute('CREATE TABLE datatable (id INTEGER PRIMARY KEY AUTOINCREMENT,note TEXT ,amount INTEGER ,date TEXT)');
        },);
  }

  Future<int> insertInDB({notes,dates,amounts,statuss})
  async {
    return await database!.insert('datatable', {'note': notes, 'amount': amounts,'date':dates,'status':statuss});

  }

}


