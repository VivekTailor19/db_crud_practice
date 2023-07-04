import 'dart:io';

import 'package:db_crud_practice/model/expense_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DB_helper {

  static DB_helper db_helper = DB_helper();
  Database? database;

  final String dbPath = "dbase.db";
  final String dbName = "datatable";

  // String? amount = "Amount";
  // String? category = "Category";
  // String? date ="Date";
  // String? status = "Status";

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
    String path = join(dir.path, dbPath);
    String query = 'CREATE TABLE $dbName (id INTEGER PRIMARY KEY AUTOINCREMENT, category TEXT, amount INTEGER, date TEXT, status TEXT)';

    return await openDatabase(path,
        version: 1,
        onCreate: (db, version) async {
         return await db.execute(query);
        },);
  }

  Future<void> insertInDB(ExpenseModel expenseModel)
  async {
    database = await createDB();
    await database!.insert(dbName, {
      'category': expenseModel.category,
      'amount': expenseModel.amount,
      'date':expenseModel.date,
      'status':expenseModel.status
    }
    );

  }


  Future<List<Map>> readDB()
  async {
    database = await createDB();
    String query = 'SELECT * FROM $dbName';
    List<Map> list = await database!.rawQuery(query);
    return list;
  }

}


