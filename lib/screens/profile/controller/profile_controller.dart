import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rcc/data/local/sqlite_db_provider.dart';
import 'package:rcc/models/mohalla.dart';
import 'package:rcc/models/profile.dart';
import 'package:rcc/models/thana.dart';
import 'package:rcc/models/ward.dart';
import 'package:rcc/screens/main_page.dart';
import 'package:rcc/utils/constants.dart';
import 'package:rcc/utils/extensitons.dart';
import 'package:rcc/utils/network/dio_client.dart';
import 'package:rcc/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart' as dio;

class ProfileController extends GetxController {

  List<Ward?> wards = <Ward>[].obs;
  List<Thana?> thanas = <Thana>[].obs;
  List<Mohalla?> mohollas = <Mohalla>[].obs;
  RxList<String> filteredMohollas = <String>[].obs;
  var createProfileDoc = <String, dynamic>{};
  RxBool createProfileLoading = false.obs;
  final DioClient? _dioClient = DioClient(BASE_URL, dio.Dio());
  final _box = GetStorage();

  var changeInfoDoc = <String, dynamic>{};
  RxBool changingInfoLoading = false.obs;


  void changeProfileInfo() async {

    try{
      changingInfoLoading(true);
      final newMap = changeInfoDoc;
      //multipart file
      newMap["nid_font"] = await dio.MultipartFile.fromFile(
          changeInfoDoc["nid_font"],
          filename: basename(changeInfoDoc["nid_font"]));
      newMap["nid_back"] = await dio.MultipartFile.fromFile(
          changeInfoDoc["nid_back"],
          filename: basename(changeInfoDoc["nid_back"]));
      newMap["profile_picture"] = await dio.MultipartFile.fromFile(
          changeInfoDoc["profile_picture"],
          filename: basename(changeInfoDoc["profile_picture"]));

      //api
      final formData = dio.FormData.fromMap(newMap);
      final response = await _dioClient?.post("/api/v1/change-request/", data: formData);
      Navigator.pop(Get.overlayContext!);
      successToast("সফল হয়েছে", "তথ প্ররিবর্তন এর রিকোয়েস্ট জমা দেয়া হয়েছে. আপনার পরিবর্তন গুলো খুব শীগ্রই গ্রহণ করা হবে");
    }catch(e){
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      errorSnackbar("দুঃখিত!", message);
      changingInfoLoading(false);
    }
  }

  void createProfile() async {
    try {
      createProfileLoading(true);

      //multipart file
      createProfileDoc["nid"] = await dio.MultipartFile.fromFile(
          createProfileDoc["nid"],
          filename: basename(createProfileDoc["nid"]));
      createProfileDoc["nid_back"] = await dio.MultipartFile.fromFile(
          createProfileDoc["nid_back"],
          filename: basename(createProfileDoc["nid_back"]));
      createProfileDoc["profile_picture"] = await dio.MultipartFile.fromFile(
          createProfileDoc["profile_picture"],
          filename: basename(createProfileDoc["profile_picture"]));
      //api
      final formData = dio.FormData.fromMap(createProfileDoc);
      final response =
          await _dioClient?.patch("/api/v1/auth/user/", data: formData);
      if (response["is_completed_profile"] == true) {
        final profile = await _dioClient?.get("/api/v1/auth/user/");
        _box.write("profile", profile);
        createProfileLoading(false);
        Get.offAll(() => const MainPage());
      } else {
        errorSnackbar("Update Profile", "Please complete your profile");
      }
    } catch (e) {
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      errorSnackbar("দুঃখিত!", message);
      createProfileLoading(false);
    }
  }

  @override
  void onInit() {
    getWardThanaMohollas();
    super.onInit();
  }

  void filterMohollas(value) {
    final newList = mohollas
        .where((element) => element?.ward == value)
        .toList()
        .map((e) => e!.mohallaBangla.toString())
        .toList();
    filteredMohollas(newList);
  }

  void getWardThanaMohollas() async {
    final _db = SQLiteDbProvider.db;

    thanas = await _db.getAllThanas();
    wards = await _db.getAllWards();
    mohollas = await _db.getAllMohollas();
  }

  void addCreateField(String key, dynamic value) {
    createProfileDoc[key] = value;
  }

  void addChangeInfoField(String key, dynamic value){
    changeInfoDoc[key] = value;
  }
}
