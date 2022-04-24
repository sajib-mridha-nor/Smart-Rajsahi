import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rcc/data/local/sqlite_db_provider.dart';
import 'package:rcc/models/profile.dart';
import 'package:rcc/models/thana.dart';
import 'package:rcc/screens/dialog/success_dialog_page.dart';
import 'package:rcc/utils/constants.dart';
import 'package:rcc/utils/extensitons.dart';
import 'package:rcc/utils/network/dio_client.dart';
import 'package:rcc/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart' as dio;
import 'package:rcc/models/mohalla.dart';

class LandUserControl extends GetxController {
  var landUserDoc = <String, dynamic>{};
  RxBool submitLoading = false.obs;
  final DioClient? _dioClient = DioClient(BASE_URL, Dio());
  final mohollas = <Mohalla?>[].obs;
  final thanas = <Thana?>[].obs;

  Profile? profile;
  final _box = GetStorage();


  @override
  void onInit() {
    getProfile();
    getRequireData();
    super.onInit();
  }

  void landUseFormSubmit() async {
    try {
      submitLoading(true);

      //api
      final formData = dio.FormData.fromMap(landUserDoc);
      final response = await _dioClient?.post("/api/v1/noc/", data: formData);

      Get.back();
      Get.to(() => SuccessDialogPage(
            message: "আপনার এপ্লিকেশন জমা দেয়া হয়েছে",
            onRetry: () {
              Get.back();
            },
          ));

      submitLoading(false);
    } catch (e) {
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      errorSnackbar("দুঃখিত!", message);
      submitLoading(false);
    }
  }

  void getRequireData() async {
    final _db = SQLiteDbProvider.db;
    final list = await _db.getAllMohollas();
    final list1 = await _db.getAllThanas();

    mohollas(list);
    thanas(list1);
  }
  void getProfile() {
    //get profile data
    final res = _box.read("profile");
    profile = Profile.fromJson(res);
  }
  void addLandUserField(String key, dynamic value) {
    landUserDoc[key] = value;
  }
}
