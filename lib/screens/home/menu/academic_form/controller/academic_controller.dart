import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rcc/models/profile.dart';
import 'package:dio/dio.dart' as dio;
import 'package:rcc/screens/dialog/success_dialog_page.dart';
import 'package:rcc/utils/constants.dart';
import 'package:rcc/utils/extensitons.dart';
import 'package:rcc/utils/network/dio_client.dart';
import 'package:rcc/utils/network/network_exceptions.dart';
import 'package:path/path.dart';

class AcademicController extends GetxController {
  final DioClient? _dioClient = DioClient(BASE_URL, Dio());
  RxBool submitLoading = false.obs;
  var fundHelpDoc = <String, dynamic>{};
  var ccSpaceRentDoc = <String, dynamic>{};
  final _box = GetStorage();
  Profile? profile;

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  void getProfile() {
    //get profile data
    final res = _box.read("profile");
    profile = Profile.fromJson(res);
  }

  void ccSpaceRentFormSubmit() async {
    try {
      submitLoading(true);

      //api
      final map = ccSpaceRentDoc;
      map["attachment"] = await dio.MultipartFile.fromFile(
          ccSpaceRentDoc["attachment"],
          filename: basename(ccSpaceRentDoc["attachment"]));

      final formData = dio.FormData.fromMap(map);
      final response = await _dioClient?.post("/api/v1/cpr/", data: formData);

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

  void fundHelpFormSubmit() async {
    try {
      submitLoading(true);

      //api
      final formData = dio.FormData.fromMap(fundHelpDoc);
      final response = await _dioClient?.post("/api/v1/fh/", data: formData);

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

  void addFundHelpDoc(key, value) {
    fundHelpDoc[key] = value;
  }

  void addCcSpaceRentDoc(key, value) {
    ccSpaceRentDoc[key] = value;
  }
}
