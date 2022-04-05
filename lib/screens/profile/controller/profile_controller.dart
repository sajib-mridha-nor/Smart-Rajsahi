import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rcc/data/local/sqlite_db_provider.dart';
import 'package:rcc/models/moholla.dart';
import 'package:rcc/models/thana.dart';
import 'package:rcc/models/ward.dart';
import 'package:rcc/utils/constants.dart';
import 'package:rcc/utils/extensitons.dart';
import 'package:rcc/utils/network/dio_client.dart';
import 'package:rcc/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart' as dio;

class ProfileController extends GetxController {

  List<Ward?> wards = <Ward>[].obs;
  List<Thana?> thanas = <Thana>[].obs;
  List<Moholla?> mohollas = <Moholla>[].obs;
  RxList<String> filteredMohollas = <String>[].obs;
  var createProfileDoc = <String, dynamic>{};
  RxBool createProfileLoading = false.obs;
  final DioClient? _dioClient = DioClient(BASE_URL, dio.Dio());
  final _box = GetStorage();

  void createProfile() async {

    try{
      createProfileLoading(true);
      
      //api
      final formData = dio.FormData.fromMap(createProfileDoc);
      final response = await _dioClient?.patch("/api/v1/auth/user/", data: formData);
      createProfileLoading(false);
    }catch(e){
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
        .where((element) => element?.thana.toString().trim() == value.toString().trim())
        .toList()
        .map((e) => e!.name.toString())
        .toList();
    filteredMohollas(newList);
  }

  void getWardThanaMohollas() async {
    final _db = SQLiteDbProvider.db;

    thanas = await _db.getAllThanas();
    wards = await _db.getAllWards();
    mohollas = await _db.getAllMohollas();
  }

  void addField(String key, dynamic value) {
    createProfileDoc[key] = value;
  }
}
