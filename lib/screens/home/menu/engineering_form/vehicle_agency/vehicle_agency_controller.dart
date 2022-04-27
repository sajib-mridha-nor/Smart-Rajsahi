import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rcc/models/profile.dart';
import 'package:rcc/screens/dialog/success_dialog_page.dart';
import 'package:rcc/screens/home/menu/engineering_form/vehicle_agency/model/equipment_type.dart';
import 'package:rcc/utils/constants.dart';
import 'package:rcc/utils/extensitons.dart';
import 'package:rcc/utils/network/dio_client.dart';
import 'package:rcc/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart';

class VehicleAgencyController extends GetxController
    with StateMixin<List<EquipmentType>> {
  final DioClient dioClient = DioClient(BASE_URL, Dio());
  final box = GetStorage();

  //map
  var vehicleAgencyMap = <String, dynamic>{};
  var profile = Rxn<Profile>();

  var signatureFile = Rxn<File>();
  var additionalFile = Rxn<File>();

  //state
  RxBool submitLoading = false.obs;

  @override
  void onInit() {
    getRequireData();
    super.onInit();
  }

  void submit() async {
    try{
      submitLoading(true);
      var map = vehicleAgencyMap;
      //multipart file
      map["citizen_signature"] = await dio.MultipartFile.fromFile(
          signatureFile.value!.path,
          filename: basename(signatureFile.value!.path));
      map["other_organisation_attachment"] = await dio.MultipartFile.fromFile(
          additionalFile.value!.path,
          filename: basename(additionalFile.value!.path));

      //api
      final formData = dio.FormData.fromMap(map);
      final response = await dioClient.post("/api/v1/vmr/", data: formData);

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
    try {
      change(null, status: RxStatus.loading());
      //get profile data
      final res = box.read("profile");
      profile(Profile.fromJson(res));

      //get equipment type
      final equipmentsRes = await dioClient.get("/api/v1/vmr/vehicle-machinery");
      final parsedList = List<EquipmentType>.from(equipmentsRes.map((i) => EquipmentType.fromJson(i)).toList());
      change(parsedList, status: RxStatus.success());
    } catch (e) {
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      change(null, status: RxStatus.error(message));
    }
  }
}
