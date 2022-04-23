import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rcc/data/local/sqlite_db_provider.dart';
import 'package:rcc/models/mohalla.dart';
import 'package:rcc/models/profile.dart';
import 'package:rcc/models/service_moholla.dart';
import 'package:rcc/screens/dialog/success_dialog_page.dart';
import 'package:rcc/utils/constants.dart';
import 'package:rcc/utils/extensitons.dart';
import 'package:rcc/utils/network/dio_client.dart';
import 'package:rcc/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart';

class HealthController extends GetxController {
  var mohollas = Rx<List<ServiceMoholla?>>([]);
  final DioClient? _dioClient = DioClient(BASE_URL, Dio());
  final _box = GetStorage();

  //Global
  Profile? profile;

  //Pet licence
  var vaccinePic = Rxn<File>();
  var animalPic = Rxn<File>();
  var createAnimalLicenceDoc = <String, dynamic>{};

  //Environment Ans
  var allegationPic = Rxn<File>();
  var createEnvironmentAnsDoc = <String, dynamic>{};

  //Environment Complaint
  var complaintPic = Rxn<File>();
  var createEnvironmentComplaint = <String, dynamic>{};

  //Sate
  RxBool petLicenceLoading = false.obs;
  RxBool environmentAnsLoading = false.obs;
  RxBool environmentComplainLoading = false.obs;

  @override
  void onInit() {
    getProfile();
    getWardThanaMohollas();
    super.onInit();
  }

  void getWardThanaMohollas() async {
    final _db = SQLiteDbProvider.db;
    mohollas(await _db.getAllServiceMohollas());
  }

  void getProfile() {
    //get profile data
    final res = _box.read("profile");
    profile = Profile.fromJson(res);
  }

  void submitPetLicence() async {
    try {
      petLicenceLoading(true);

      //api
      final map = createAnimalLicenceDoc;
      map["vaccine_pic"] = await dio.MultipartFile.fromFile(
          vaccinePic.value!.path,
          filename: basename(vaccinePic.value!.path));
      map["animal_picture"] = await dio.MultipartFile.fromFile(
          animalPic.value!.path,
          filename: basename(animalPic.value!.path));

      final formData = dio.FormData.fromMap(map);
      final response = await _dioClient?.post("/api/v1/pal/", data: formData);
      Get.back();
      Get.to(() => SuccessDialogPage(
            message: "আপনার এপ্লিকেশন জমা দেয়া হয়েছে",
            onRetry: () {
              Get.back();
            },
          ));
      petLicenceLoading(false);
    } catch (e) {
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      errorSnackbar("দুঃখিত!", message);
      petLicenceLoading(false);
    }
  }

  void submitEnvironmentAns() async {
    try {
      environmentAnsLoading(true);

      //api
      final map = createEnvironmentAnsDoc;
      map["images"] = await dio.MultipartFile.fromFile(
          allegationPic.value!.path,
          filename: basename(allegationPic.value!.path));

      final formData = dio.FormData.fromMap(map);
      final response = await _dioClient?.post("/api/v1/epr/", data: formData);
      Get.back();
      Get.to(() => SuccessDialogPage(
            message: "আপনার এপ্লিকেশন জমা দেয়া হয়েছে",
            onRetry: () {
              Get.back();
            },
          ));
      environmentAnsLoading(false);
    } catch (e) {
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      errorSnackbar("দুঃখিত!", message);
      environmentAnsLoading(false);
    }
  }

  void submitEnvironmentComplain() async {
    try {
      environmentComplainLoading(true);

      //api
      final map = createEnvironmentComplaint;
      final mohollaId = mohollas.value
          .firstWhere((element) =>
              element?.name.toString().trim() ==
              map["complained_org_moholla"].toString().trim())
          ?.id;
      map["complained_org_moholla"] = mohollaId;
      map["images"] = await dio.MultipartFile.fromFile(complaintPic.value!.path,
          filename: basename(complaintPic.value!.path));

      final formData = dio.FormData.fromMap(map);
      final response = await _dioClient?.post("/api/v1/epc/", data: formData);
      Get.back();
      Get.to(() => SuccessDialogPage(
            message: "আপনার এপ্লিকেশন জমা দেয়া হয়েছে",
            onRetry: () {
              Get.back();
            },
          ));
      environmentComplainLoading(false);
    } catch (e) {
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      errorSnackbar("দুঃখিত!", message);
      environmentComplainLoading(false);
    }
  }
}
