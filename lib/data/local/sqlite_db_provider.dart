import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:rcc/models/mohalla.dart';
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
                  "thana_bangla TEXT,"
                  "thana TEXT"")"
          );
          //create ward list
          await db.execute(
              "CREATE TABLE wards ("
                  "id INTEGER PRIMARY KEY,"
                  "ward_no INTEGER,"
                  "ward_no_bangla TEXT,"
                  "post_office INTEGER"")"
          );
          //create moholla list
          await db.execute(
              "CREATE TABLE mohollas ("
                  "id INTEGER PRIMARY KEY,"
                  "mohalla TEXT,"
                  "ward INTEGER,"
                  "mohalla_bangla TEXT"")"
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

  Future<List<Mohalla?>> getAllMohollas() async {
    final db = await database;
    List<Map>? results = await db?.query(
        "mohollas", columns: Mohalla.columns, orderBy: "id ASC"
    );
    List<Mohalla?>? mohollas = [];
    results?.forEach((result) {
      Mohalla moholla = Mohalla.fromJson(result);
      mohollas.add(moholla);
    });
    return mohollas;
  }

}