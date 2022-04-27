import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:rcc/data/local/sqlite_db_provider.dart';
import 'package:rcc/models/profile.dart';
import 'package:rcc/models/service_moholla.dart';
import 'package:rcc/models/service_thana.dart';
import 'package:rcc/models/service_ward.dart';
import 'package:rcc/screens/dialog/success_dialog_page.dart';
import 'package:rcc/utils/constants.dart';
import 'package:rcc/utils/extensitons.dart';
import 'package:rcc/utils/network/dio_client.dart';
import 'package:rcc/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart' as dio;

class EngineeringController extends GetxController {

  final box = GetStorage();
  final DioClient? dioClient = DioClient(BASE_URL, Dio());

  //Require data for form registration
  var wards = Rx<List<ServiceWard?>>([]);
  var mohollas = Rx<List<ServiceMoholla?>>([]);
  var thanas = Rx<List<ServiceThana?>>([]);
  var profile = Rxn<Profile>();

  //Form Files
  var nidFile = Rxn<File>();
  var demandNoteFile = Rxn<File>();
  var taxFile = Rxn<File>();

  //Form map
  var waterConnectionMap = <String, dynamic>{};

  //state
  RxBool submitLoading = false.obs;

  @override
  void onInit() {
    getProfile();
    getRequireData();
    super.onInit();
  }

  void getProfile() {
    //get profile data
    final res = box.read("profile");
    profile(Profile.fromJson(res));
  }

  void waterGasConnectionFormSubmit() async {
    try{
      submitLoading(true);
      var map = waterConnectionMap;
      //multipart file
      map["nid"] = await dio.MultipartFile.fromFile(
          nidFile.value!.path,
          filename: basename(nidFile.value!.path));
      map["wasa_paper"] = await dio.MultipartFile.fromFile(
          demandNoteFile.value!.path,
          filename: basename(demandNoteFile.value!.path));
      map["tax_receipt"] = await dio.MultipartFile.fromFile(
          taxFile.value!.path,
          filename: basename(taxFile.value!.path));

      //api
      final formData = dio.FormData.fromMap(map);
      final response = await dioClient?.post("/api/v1/wg/", data: formData);

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
    wards(await _db.getAllServiceWards());
    mohollas(await _db.getAllServiceMohollas());
    thanas(await _db.getAllServiceThanas());
  }

}