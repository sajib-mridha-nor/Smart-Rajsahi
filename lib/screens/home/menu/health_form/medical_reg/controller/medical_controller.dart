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
import 'package:rcc/screens/home/menu/health_form/medical_reg/model/TypeBusiness.dart';
import 'package:rcc/screens/home/menu/health_form/premises_registration/model/temperament.dart';
import 'package:rcc/screens/home/menu/health_form/premises_registration/model/temperament_type.dart';
import 'package:rcc/utils/constants.dart';
import 'package:rcc/utils/extensitons.dart';
import 'package:rcc/utils/network/dio_client.dart';
import 'package:rcc/utils/network/network_exceptions.dart';
import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart';

import '../model/NatureMedical.dart';

class MedicalRegController extends GetxController with StateMixin<bool> {

}
