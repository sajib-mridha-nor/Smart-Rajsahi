import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:rcc/data/local/sqlite_db_provider.dart';
import 'package:rcc/models/mohalla.dart';
import 'package:rcc/screens/dialog/success_dialog_page.dart';
import 'package:rcc/utils/constants.dart';
import 'package:rcc/utils/extensitons.dart';
import 'package:rcc/utils/network/dio_client.dart';
import 'package:rcc/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart' as dio;

class GarbageController extends GetxController {

  final mohollas = <Mohalla?>[].obs;
  var garbageRemovalDoc = <String, dynamic>{};
  RxBool submitLoading = false.obs;
  final DioClient? _dioClient = DioClient(BASE_URL, Dio());

  var trackRemoveDoc = <String, dynamic>{};

  @override
  void onInit() {
    getRequireData();
    super.onInit();
  }


  void garbageRemoveFormSubmit() async {
    try{
      submitLoading(true);

      //api
      final formData = dio.FormData.fromMap(garbageRemovalDoc);
      final response = await _dioClient?.post("/api/v1/wm/", data: formData);

      Get.back();
      Get.to(()=> SuccessDialogPage(message: "আপনার এপ্লিকেশন জমা দেয়া হয়েছে", onRetry: (){
        Get.back();
      },));

      submitLoading(false);
    }catch(e){
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      errorSnackbar("দুঃখিত!", message);
      submitLoading(false);
    }
  }

  void trackRemoveFormSubmit() async {
    try{
      submitLoading(true);

      //api
      final formData = dio.FormData.fromMap(trackRemoveDoc);
      final response = await _dioClient?.post("/api/v1/rbm/", data: formData);

      Get.back();
      Get.to(()=> SuccessDialogPage(message: "আপনার এপ্লিকেশন জমা দেয়া হয়েছে", onRetry: (){
        Get.back();
      },));

      submitLoading(false);
    }catch(e){
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      errorSnackbar("দুঃখিত!", message);
      submitLoading(false);
    }
  }

  void getRequireData() async {
    final _db = SQLiteDbProvider.db;
    final list = await _db.getAllMohollas();
    mohollas(list);
  }

  void addGarbageRemovalField(String key, dynamic value){
    garbageRemovalDoc[key] = value;
  }

  void addTrackRemoveField(String key, dynamic value){
    trackRemoveDoc[key] = value;
  }
}

