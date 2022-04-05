import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rcc/data/local/sqlite_db_provider.dart';
import 'package:rcc/models/moholla.dart';
import 'package:rcc/models/profile_response.dart';
import 'package:rcc/models/thana.dart';
import 'package:rcc/models/ward.dart';
import 'package:rcc/screens/main_page.dart';
import 'package:rcc/screens/profile/create/profile_create_page.dart';
import 'package:rcc/utils/constants.dart';
import 'package:rcc/utils/extensitons.dart';
import 'package:rcc/utils/network/dio_client.dart';
import 'package:rcc/utils/network/network_exceptions.dart';
import 'package:sqflite/sqflite.dart';

class SplashController extends GetxController with StateMixin<bool> {

  final DioClient? _dioClient = DioClient(BASE_URL, Dio());
  final _box = GetStorage();

  @override
  void onReady() {
    getRequireData();
    super.onReady();
  }

  Widget _getPage(){
    final profile = ProfileResponse.fromJson(_box.read("profile"));
    if(profile.isCompletedProfile == true) return const MainPage();
    return const ProfileCreatePage();
  }

  void getRequireData() async {
    try{
      change(null, status: RxStatus.loading());

      Database? db = await SQLiteDbProvider.db.database;
      final thanaResponse = await _dioClient?.get("/api/v1/thana/");
      final wardResponse = await _dioClient?.get("/api/v1/ward/");
      final mohollaResponse = await _dioClient?.get("/api/v1/moholla/");

      final List<Thana> thanaList = List<Thana>.from(thanaResponse.map((i) => Thana.fromJson(i)).toList());
      final List<Ward> wardList = List<Ward>.from(wardResponse.map((i) => Ward.fromJson(i)).toList());
      final List<Moholla> mohollaList = List<Moholla>.from(mohollaResponse.map((i) => Moholla.fromJson(i)).toList());

      //inset list to db
      Batch? batch = db?.batch();

      //clear table
      batch?.delete("thanas");
      batch?.delete("wards");
      batch?.delete("mohollas");
      //insert thanas
      for (var element in thanaList) {
        batch?.insert('thanas', element.toJson());
      }
      //inset ward
      for (var element in wardList) {
        batch?.insert('wards', element.toJson());
      }
      //moholla ward
      for (var element in mohollaList) {
        batch?.insert('mohollas', element.toJson());
      }

      await batch?.commit(noResult: true);
      _box.write("is_fetched", true);

      //move to page
      Get.offAll(()=> _getPage());
      change(null, status: RxStatus.success());
    }catch(e){
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);

      //check if already fetched
      if(_box.read("is_fetched") == true){
        //move to page
        Get.offAll(()=> _getPage());
      }else{
        errorSnackbar("দুঃখিত!", message);
        change(null, status: RxStatus.error());
      }
    }
  }

}

