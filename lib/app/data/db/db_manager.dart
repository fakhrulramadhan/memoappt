import 'dart:io';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseManager {
  //buat privat constructor
  DatabaseManager._privateConstructor();
  static DatabaseManager instance = DatabaseManager._privateConstructor();

  Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDB();
      return _db!;
    } else {
      return _db!;
    }
  }

  Future _initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, "memo.db");

    return await openDatabase(path, version: 1,
        onCreate: (database, version) async {
      return await database.execute('''
        CREATE TABLE memo(
          id INTEGER PRIMARY KEY,
          judul TEXT NOT NULL,
          isi TEXT NOT NULL
      )''');
    });
  }

  Future closeDB() async {
    _db = await instance.db;

    _db!.close();
  }
}
