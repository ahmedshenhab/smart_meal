// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Sqldb {
  static Database? _db;
  Future<Database?>? get db async {
    if (_db == null) {
      _db = await initializeDb();
      log('will creat data base');

      return _db;
    } else {
      log('created data base');
      return _db;
    }
  }

  initializeDb() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'ahmed.db');

    Database myDB = await openDatabase(path,
        onCreate: oncreate, version: 1 , onUpgrade: onUpgrade);

    return myDB;
  }

  onUpgrade(Database db, int oldVersion, int newVersion) {
    log('onUpgrade');
  }

  oncreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE "notes" (
        'id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        'note' TEXT NOT NULL
      )
      ''',
    );

    log('onCreat ++++++++++++++++++++++++++++++');
  }

  Future<List<Map<String, Object?>>> readData(String sql) async {
    Database? myDB = await db;

    List<Map<String, Object?>> response = await myDB!.rawQuery(sql);

    return response;
  }

  insertData(String sql) async {
    Database? myDB = await db;

    int response = await myDB!.rawInsert(sql);

    return response;
  }

  updateData(String sql) async {
    Database? myDB = await db;

    int response = await myDB!.rawUpdate(sql);

    return response;
  }

  Future<int> deleteData(String sql) async {
    Database? myDB = await db;

    int response = await myDB!.rawDelete(sql);

    return response;
  }
}
