import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rcc/screens/test_page.dart';
import 'package:rcc/utils/palette.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
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
      home: const TestPage(),
    );
  }
}
