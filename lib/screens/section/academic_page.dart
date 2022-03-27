import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/form%20design/academic%20form%20/academic_form.dart';
import 'package:rcc/screens/form%20design/academic%20form%20/academic_place_rent_form.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_banner.dart';
import 'package:rcc/widgets/custom_card_text.dart';
import 'package:rcc/widgets/gradient_text.dart';

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
            automaticallyImplyLeading: false,
            titleSpacing: 3.0,
            elevation: 15.0,
            leading: const BackButton(),
            title: const Text('প্রশাসনিক বিভাগ'),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 14.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      MdiIcons.bellRing,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  )),
            ],
            gradient:
                LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")])),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CustomBanner(),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: const GradientText(
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
              GestureDetector(
                onTap: (){
                  Get.to(const AcademicPlaceRentForm());
                },
                child: const CustomCardText(
                    title: 'সিটি কর্পোরেশনের জায়গা ভাড়া',
                    icon: 'assets/images/groupicon.png'),
              ),
              GestureDetector(
                onTap: (){
                  Get.to(AcademicForm());
                },
                child: const CustomCardText(
                    title: 'আর্থিক সহায়তা প্রদান',
                    icon: 'assets/images/groupicon.png'),
              ),
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
