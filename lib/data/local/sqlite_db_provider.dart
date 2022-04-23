import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:rcc/models/mohalla.dart';
import 'package:rcc/models/service_moholla.dart';
import 'package:rcc/models/service_thana.dart';
import 'package:rcc/models/service_ward.dart';
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
          //create service moholla list
          await db.execute(
              "CREATE TABLE service_mohollas ("
                  "id INTEGER PRIMARY KEY,"
                  "name TEXT,"
                  "ward_no INTEGER,"
                  "thana TEXT"")"
          );
          //create service thana list
          await db.execute(
              "CREATE TABLE service_thanas ("
                  "id INTEGER PRIMARY KEY,"
                  "name TEXT"")"
          );
          //create service ward list
          await db.execute(
              "CREATE TABLE service_wards ("
                  "id INTEGER PRIMARY KEY,"
                  "ward_no INTEGER,"
                  "ward_councillor TEXT,"
                  "ward_secretary TEXT"")"
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

  Future<List<ServiceMoholla?>> getAllServiceMohollas() async {
    final db = await database;
    List<Map>? results = await db?.query(
        "service_mohollas", columns: ServiceMoholla.columns, orderBy: "id ASC"
    );
    List<ServiceMoholla?>? mohollas = [];
    results?.forEach((result) {
      ServiceMoholla moholla = ServiceMoholla.fromJson(result);
      mohollas.add(moholla);
    });
    return mohollas;
  }

  Future<List<ServiceThana?>> getAllServiceThanas() async {
    final db = await database;
    List<Map>? results = await db?.query(
        "service_thanas", columns: ServiceThana.columns, orderBy: "id ASC"
    );
    List<ServiceThana?>? thanas = [];
    results?.forEach((result) {
      ServiceThana thana = ServiceThana.fromJson(result);
      thanas.add(thana);
    });
    return thanas;
  }

  Future<List<ServiceWard?>> getAllServiceWards() async {
    final db = await database;
    List<Map>? results = await db?.query(
        "service_wards", columns: ServiceWard.columns, orderBy: "id ASC"
    );
    List<ServiceWard?>? wards = [];
    results?.forEach((result) {
      ServiceWard ward = ServiceWard.fromJson(result);
      wards.add(ward);
    });
    return wards;
  }

}