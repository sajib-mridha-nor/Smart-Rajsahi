import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rcc/data/local/sqlite_db_provider.dart';
import 'package:rcc/models/mohalla.dart';
import 'package:rcc/models/profile.dart';
import 'package:rcc/models/thana.dart';
import 'package:rcc/models/ward.dart';
import 'package:rcc/screens/auth/login/login_page.dart';
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

    final cachedProfile = _box.read("profile");
    if(cachedProfile != null){
      final profile = Profile.fromJson(cachedProfile);
      if(profile.isCompletedProfile == true) return const MainPage();
      return const ProfileCreatePage();
    }else{
      return const LoginPage();
    }

  }

  void getRequireData() async {
    try{
      change(null, status: RxStatus.loading());

      Database? db = await SQLiteDbProvider.db.database;

      try{
        final profileResponse = await _dioClient?.get("/api/v1/auth/user/");
        _box.write("profile", profileResponse);
      }catch(e){
        debugPrint(e.toString());
      }

      final thanaResponse = await _dioClient?.get("/api/v1/address/thana/");
      final wardResponse = await _dioClient?.get("/api/v1/address/ward/");
      final mohollaResponse = await _dioClient?.get("/api/v1/address/mohalla/");

      final developmentPhotosResponse = await _dioClient?.get("/api/v1/development-photos/");
      final featureVideosResponse = await _dioClient?.get("/api/v1/feature-video/");
      final bannerResponse = await _dioClient?.get("/api/v1/banner/");

      final List<Thana> thanaList = List<Thana>.from(thanaResponse.map((i) => Thana.fromJson(i)).toList());
      final List<Ward> wardList = List<Ward>.from(wardResponse.map((i) => Ward.fromJson(i)).toList());
      final List<Mohalla> mohollaList = List<Mohalla>.from(mohollaResponse.map((i) => Mohalla.fromJson(i)).toList());

      //insert cached data
      _box.write("dev_photos", developmentPhotosResponse);
      _box.write("feature_video", featureVideosResponse);
      _box.write("banner", bannerResponse);

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
        change(null, status: RxStatus.error(message));
      }
    }
  }

}

