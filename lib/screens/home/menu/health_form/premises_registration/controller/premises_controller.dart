import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rcc/data/local/sqlite_db_provider.dart';
import 'package:rcc/models/profile.dart';
import 'package:rcc/models/ward.dart';
import 'package:rcc/screens/dialog/success_dialog_page.dart';
import 'package:rcc/screens/home/menu/health_form/premises_registration/model/temperament.dart';
import 'package:rcc/screens/home/menu/health_form/premises_registration/model/temperament_type.dart';
import 'package:rcc/utils/constants.dart';
import 'package:rcc/utils/extensitons.dart';
import 'package:rcc/utils/network/dio_client.dart';
import 'package:rcc/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart';

class PremisesController extends GetxController with StateMixin<bool> {

  final DioClient? _dioClient = DioClient(BASE_URL, Dio());
  var premisesRegistrationDoc = <String, dynamic>{};

  final _box = GetStorage();
  RxList<Temperament> temperaments = <Temperament>[].obs;
  RxList<TemperamentType> temperamentTypes = <TemperamentType>[].obs;
  Profile? profile;
  List<Ward?> wards = <Ward>[].obs;

  RxBool submitLoading = false.obs;

  @override
  void onInit() {
    getTemperament();
    getProfile();
    getRequireData();
    super.onInit();
  }


  void submit() async {

    try{
      submitLoading(true);
      var map = premisesRegistrationDoc;
      //multipart file
      map["applicant_photo"] = await dio.MultipartFile.fromFile(
          premisesRegistrationDoc["applicant_photo"],
          filename: basename(premisesRegistrationDoc["applicant_photo"]));
      map["rent_lease_owner_receipt"] = await dio.MultipartFile.fromFile(
          premisesRegistrationDoc["rent_lease_owner_receipt"],
          filename: basename(premisesRegistrationDoc["rent_lease_owner_receipt"]));
      map["registration_renewal"] = await dio.MultipartFile.fromFile(
          premisesRegistrationDoc["registration_renewal"],
          filename: basename(premisesRegistrationDoc["registration_renewal"]));
      map["owner_birth_certificate"] = await dio.MultipartFile.fromFile(
          premisesRegistrationDoc["owner_birth_certificate"],
          filename: basename(premisesRegistrationDoc["owner_birth_certificate"]));
      map["bsti_agreement_letter"] = await dio.MultipartFile.fromFile(
          premisesRegistrationDoc["bsti_agreement_letter"],
          filename: basename(premisesRegistrationDoc["bsti_agreement_letter"]));
      map["citizenship_certificate"] = await dio.MultipartFile.fromFile(
          premisesRegistrationDoc["citizenship_certificate"],
          filename: basename(premisesRegistrationDoc["citizenship_certificate"]));
      map["water_connection"] = await dio.MultipartFile.fromFile(
          premisesRegistrationDoc["water_connection"],
          filename: basename(premisesRegistrationDoc["water_connection"]));
      map["environment_approval"] = await dio.MultipartFile.fromFile(
          premisesRegistrationDoc["environment_approval"],
          filename: basename(premisesRegistrationDoc["environment_approval"]));
      map["health_related_issue"] = await dio.MultipartFile.fromFile(
          premisesRegistrationDoc["health_related_issue"],
          filename: basename(premisesRegistrationDoc["health_related_issue"]));

      //api
      final formData = dio.FormData.fromMap(map);
      final response = await _dioClient?.post("/api/v1/pr/", data: formData);

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
    wards = await _db.getAllWards();
  }
  void getProfile(){
    //get profile data
    final res = _box.read("profile");
    profile = Profile.fromJson(res);
  }
  void getTemperament() async {
    try{
      change(true, status: RxStatus.loading());
      final temperamentRes = await _dioClient?.get("/api/v1/pr/temperament/");
      final temperamentTypeRes = await _dioClient?.get("/api/v1/pr/temperament-type/");
      temperaments(List<Temperament>.from(temperamentRes.map((i) => Temperament.fromJson(i)).toList()));
      temperamentTypes(List<TemperamentType>.from(temperamentTypeRes.map((i) => TemperamentType.fromJson(i)).toList()));
      change(true, status: RxStatus.success());
    }catch(e){
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      change(false, status: RxStatus.error(message));
    }
  }
  void addValueToDoc(key, value){
    premisesRegistrationDoc[key] = value;
  }
}