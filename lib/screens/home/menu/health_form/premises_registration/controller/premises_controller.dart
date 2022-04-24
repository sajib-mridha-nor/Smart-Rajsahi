import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rcc/data/local/sqlite_db_provider.dart';
import 'package:rcc/models/profile.dart';
import 'package:rcc/models/service_moholla.dart';
import 'package:rcc/models/service_thana.dart';
import 'package:rcc/models/service_ward.dart';
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
  RxList<TemperamentType> filterTemperamentTypes = <TemperamentType>[].obs;
  Profile? profile;
  List<ServiceWard?> wards = <ServiceWard>[].obs;
  List<ServiceMoholla?> mohollas = <ServiceMoholla>[].obs;
  List<ServiceThana?> thanas = <ServiceThana>[].obs;

  //form data
  var applicantPhoto = Rxn<File>();
  var rentLeaseOwnerReceipt = Rxn<File>();
  var registrationRenewal = Rxn<File>();
  var ownerBirthCertificate = Rxn<File>();
  var bstiAgreementLetter = Rxn<File>();
  var citizenshipCertificate = Rxn<File>();
  var waterConnection = Rxn<File>();
  var environmentApproval = Rxn<File>();
  var healthRelatedIssue = Rxn<File>();

  RxBool submitLoading = false.obs;

  @override
  void onInit() {
    getTemperament();
    getProfile();
    getRequireData();
    super.onInit();
  }

  void filterTemperamentType(int? id) {
    final items = temperamentTypes.value
        .where((element) => element.temperament?.id == id)
        .toList()
        .map((e) {
      return TemperamentType(
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
      var map = premisesRegistrationDoc;
      //multipart file
      map["applicant_photo"] = await dio.MultipartFile.fromFile(
          applicantPhoto.value!.path,
          filename: basename(applicantPhoto.value!.path));
      map["rent_lease_owner_receipt"] = await dio.MultipartFile.fromFile(
          rentLeaseOwnerReceipt.value!.path,
          filename: basename(rentLeaseOwnerReceipt.value!.path));
      map["registration_renewal"] = await dio.MultipartFile.fromFile(
          registrationRenewal.value!.path,
          filename: basename(registrationRenewal.value!.path));
      map["owner_birth_certificate"] = await dio.MultipartFile.fromFile(
          ownerBirthCertificate.value!.path,
          filename: basename(ownerBirthCertificate.value!.path));
      map["bsti_agreement_letter"] = await dio.MultipartFile.fromFile(
          bstiAgreementLetter.value!.path,
          filename: basename(bstiAgreementLetter.value!.path));
      map["citizenship_certificate"] = await dio.MultipartFile.fromFile(
          citizenshipCertificate.value!.path,
          filename: basename(citizenshipCertificate.value!.path));
      map["water_connection"] = await dio.MultipartFile.fromFile(
          waterConnection.value!.path,
          filename: basename(waterConnection.value!.path));
      map["environment_approval"] = await dio.MultipartFile.fromFile(
          environmentApproval.value!.path,
          filename: basename(environmentApproval.value!.path));
      map["health_related_issue"] = await dio.MultipartFile.fromFile(
          healthRelatedIssue.value!.path,
          filename: basename(healthRelatedIssue.value!.path));

      //api
      final formData = dio.FormData.fromMap(map);
      final response = await _dioClient?.post("/api/v1/pr/", data: formData);

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
    wards = await _db.getAllServiceWards();
    mohollas = await _db.getAllServiceMohollas();
    thanas = await _db.getAllServiceThanas();
  }

  void getProfile() {
    //get profile data
    final res = _box.read("profile");
    profile = Profile.fromJson(res);
  }

  void getTemperament() async {
    try {
      change(true, status: RxStatus.loading());
      final temperamentRes = await _dioClient?.get("/api/v1/pr/temperament/");
      final temperamentTypeRes =
          await _dioClient?.get("/api/v1/pr/temperament-type/");
      temperaments(List<Temperament>.from(
          temperamentRes.map((i) => Temperament.fromJson(i)).toList()));
      temperamentTypes(List<TemperamentType>.from(
          temperamentTypeRes.map((i) => TemperamentType.fromJson(i)).toList()));
      change(true, status: RxStatus.success());
    } catch (e) {
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      change(false, status: RxStatus.error(message));
    }
  }

  void addValueToDoc(key, value) {
    premisesRegistrationDoc[key] = value;
  }
}
