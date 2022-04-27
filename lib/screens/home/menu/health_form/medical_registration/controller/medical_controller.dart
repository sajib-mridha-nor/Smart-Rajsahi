import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rcc/data/local/sqlite_db_provider.dart';
import 'package:rcc/models/profile.dart';
import 'package:rcc/models/service_moholla.dart';
import 'package:rcc/models/service_thana.dart';
import 'package:rcc/models/service_ward.dart';
import 'package:rcc/screens/dialog/success_dialog_page.dart';
import 'package:rcc/screens/home/menu/health_form/medical_registration/model/med_temperament.dart';
import 'package:rcc/screens/home/menu/health_form/medical_registration/model/med_temperament_type.dart';
import 'package:rcc/utils/constants.dart';
import 'package:rcc/utils/extensitons.dart';
import 'package:rcc/utils/network/dio_client.dart';
import 'package:rcc/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart';

class MedicalController extends GetxController with StateMixin<bool> {
  final DioClient _dioClient = DioClient(BASE_URL, Dio());
  var medicalRegistrationDoc = <String, dynamic>{};

  final _box = GetStorage();

  var temperaments = Rx<List<MedTemperament>>([]);
  var temperamentTypes = Rx<List<MedTemperamentType>>([]);
  var filterTemperamentTypes = Rx<List<MedTemperamentType>>([]);

  var wards = Rx<List<ServiceWard?>>([]);
  var mohollas = Rx<List<ServiceMoholla?>>([]);
  var thanas = Rx<List<ServiceThana?>>([]);

  var profile = Rxn<Profile>();

  RxBool submitLoading = false.obs;

  //form data
  var applicantPhoto = Rxn<File>();
  var rentLeaseOwnerReceipt = Rxn<File>();
  var registrationRenewal = Rxn<File>();
  var ownerNid = Rxn<File>();
  var citizenshipCertificate = Rxn<File>();
  var waterConnection = Rxn<File>();
  var environmentApproval = Rxn<File>();
  var holdingTax = Rxn<File>();

  @override
  void onInit() {
    getRequireData();
    super.onInit();
  }

  void filterTemperamentType(int? id) {
    final items = temperamentTypes.value
        .where((element) => element.temperament?.id == id)
        .toList()
        .map((e) {
      return MedTemperamentType(
          id: e.id,
          temperament: e.temperament,
          type: e.type.toString() + ":(" + e.fee.toString() + " টাকা)",
          fee: e.fee);
    }).toList();
    filterTemperamentTypes(items);
  }

  void submit() async {
    try {
      submitLoading(true);
      var map = medicalRegistrationDoc;
      //multipart file
      map["applicant_photo"] = await dio.MultipartFile.fromFile(
          applicantPhoto.value!.path,
          filename: basename(applicantPhoto.value!.path));
      map["vara_copy"] = await dio.MultipartFile.fromFile(
          rentLeaseOwnerReceipt.value!.path,
          filename: basename(rentLeaseOwnerReceipt.value!.path));
      map["registration_renewal"] = await dio.MultipartFile.fromFile(
          registrationRenewal.value!.path,
          filename: basename(registrationRenewal.value!.path));
      map["owner_nid"] = await dio.MultipartFile.fromFile(
          ownerNid.value!.path,
          filename: basename(ownerNid.value!.path));
      map["citizenship_certificate"] = await dio.MultipartFile.fromFile(
          citizenshipCertificate.value!.path,
          filename: basename(citizenshipCertificate.value!.path));
      map["environment_approval"] = await dio.MultipartFile.fromFile(
          environmentApproval.value!.path,
          filename: basename(environmentApproval.value!.path));
      map["water_connection"] = await dio.MultipartFile.fromFile(
          waterConnection.value!.path,
          filename: basename(waterConnection.value!.path));
      map["holding_tax"] = await dio.MultipartFile.fromFile(
          holdingTax.value!.path,
          filename: basename(holdingTax.value!.path));

      //api
      final formData = dio.FormData.fromMap(map);
      final response = await _dioClient.post("/api/v1/mr/", data: formData);

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
    try {
      change(true, status: RxStatus.loading());
      final temperamentRes = await _dioClient.get("/api/v1/mr/temperament/");
      final temperamentTypeRes =
          await _dioClient.get("/api/v1/mr/temperament-type/");
      temperaments(List<MedTemperament>.from(
          temperamentRes.map((i) => MedTemperament.fromJson(i)).toList()));
      temperamentTypes(List<MedTemperamentType>.from(temperamentTypeRes
          .map((i) => MedTemperamentType.fromJson(i))
          .toList()));

      final _db = SQLiteDbProvider.db;
      wards(await _db.getAllServiceWards());
      mohollas(await _db.getAllServiceMohollas());
      thanas(await _db.getAllServiceThanas());

      final res = _box.read("profile");
      profile(Profile.fromJson(res));

      change(true, status: RxStatus.success());
    } catch (e) {
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      change(false, status: RxStatus.error(message));
    }
  }

}
