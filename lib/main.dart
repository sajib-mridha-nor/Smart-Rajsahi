import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rcc/screens/form%20design/engineering_water_gas_form.dart';
import 'package:rcc/screens/section/academic_page.dart';

import 'package:rcc/screens/auth/send_otp_page.dart';
import 'package:rcc/screens/section/bin_page.dart';
import 'package:rcc/screens/section/health_page.dart';
import 'package:rcc/screens/section/engineering_page.dart';
import 'package:rcc/screens/home/home_page.dart';
import 'package:rcc/screens/section/revenue_page.dart';
import 'package:rcc/screens/test_page.dart';
import 'package:rcc/utils/palette.dart';

void main() async {
  // SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RCC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Palette.mcgrcc,
        textTheme: GoogleFonts.hindSiliguriTextTheme(),
        appBarTheme: const AppBarTheme(
          elevation: 8,
          shadowColor: Colors.black26,
          centerTitle: false,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}

