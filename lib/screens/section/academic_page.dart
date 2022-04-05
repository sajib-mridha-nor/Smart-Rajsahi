import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/home/menu/academic_form/academic_form.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_banner.dart';
import 'package:rcc/widgets/custom_card_text.dart';
import 'package:rcc/widgets/gradient_text.dart';

import '../home/menu/academic_form/academic_place_rent_form.dart';




class AcademicPage extends StatefulWidget {
  const AcademicPage({Key? key}) : super(key: key);

  @override
  State<AcademicPage> createState() => _AcademicPageState();
}

class _AcademicPageState extends State<AcademicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewGradientAppBar(
            title: const Text('প্রশাসনিক বিভাগ'),
            gradient:
                LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")])),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CustomBanner(),
              const SizedBox(
                height: 16.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: GradientText(
                  "প্রশাসনিক বিভাগ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const CustomCardText(
                  title: 'বিবাহবিচ্ছেদ', icon: 'assets/images/groupicon.png'),
              const CustomCardText(
                  title: 'ববিবিধ সনদপত্র', icon: 'assets/images/groupicon.png'),
              const CustomCardText(
                  title: 'বিরোধ নিষ্পত্তি',
                  icon: 'assets/images/groupicon.png'),
              CustomCardText(
                title: 'সিটি কর্পোরেশনের জায়গা ভাড়া',
                icon: 'assets/images/groupicon.png',
                onTap: () {
                  Get.to(const AcademicPlaceRentForm());
                },
              ),
              CustomCardText(
                  title: 'আর্থিক সহায়তা প্রদান',
                  icon: 'assets/images/groupicon.png',
                  onTap: () {
                    Get.to(const AcademicForm());
                  }),
              const CustomCardText(
                  title: 'নাগরিকত্বের সনদপত্র',
                  icon: 'assets/images/groupicon.png'),
              const CustomCardText(
                  title: 'উত্তরাধিকার সনদপত্র',
                  icon: 'assets/images/groupicon.png'),
            ],
          ),
        ));
  }
}
