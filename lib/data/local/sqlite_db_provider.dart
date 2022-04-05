import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:rcc/models/moholla.dart';
import 'package:rcc/models/thana.dart';
import 'package:rcc/models/ward.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteDbProvider {
  SQLiteDbProvider._();
  static final SQLiteDbProvider db = SQLiteDbProvider._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }
  initDB() async {
    Directory documentsDirectory = await
    getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "app_db.db");
    return await openDatabase(
        path, version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {

          //create thana table
          await db.execute(
              "CREATE TABLE thanas ("
                  "id INTEGER PRIMARY KEY,"
                  "name TEXT"")"
          );
          //create ward list
          await db.execute(
              "CREATE TABLE wards ("
                  "id INTEGER PRIMARY KEY,"
                  "ward_no INTEGER,"
                  "ward_councillor TEXT,"
                  "ward_secretary TEXT"")"
          );
          //create moholla list
          await db.execute(
              "CREATE TABLE mohollas ("
                  "id INTEGER PRIMARY KEY,"
                  "name TEXT,"
                  "ward_no INTEGER,"
                  "thana TEXT"")"
          );
        }
    );
  }

  Future<List<Thana?>> getAllThanas() async {
    final db = await database;
    List<Map>? results = await db?.query(
        "thanas", columns: Thana.columns, orderBy: "id ASC"
    );
    List<Thana?>? thanas = [];
    results?.forEach((result) {
      Thana thana = Thana.fromJson(result);
      thanas.add(thana);
    });
    return thanas;
  }

  Future<List<Ward?>> getAllWards() async {
    final db = await database;
    List<Map>? results = await db?.query(
        "wards", columns: Ward.columns, orderBy: "id ASC"
    );
    List<Ward?>? wards = [];
    results?.forEach((result) {
      Ward ward = Ward.fromJson(result);
      wards.add(ward);
    });
    return wards;
  }

  Future<List<Moholla?>> getAllMohollas() async {
    final db = await database;
    List<Map>? results = await db?.query(
        "mohollas", columns: Moholla.columns, orderBy: "id ASC"
    );
    List<Moholla?>? mohollas = [];
    results?.forEach((result) {
      Moholla moholla = Moholla.fromJson(result);
      mohollas.add(moholla);
    });
    return mohollas;
  }

}