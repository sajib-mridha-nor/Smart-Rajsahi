import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/form%20design/health_form/animal_lisence_form.dart';
import 'package:rcc/screens/form%20design/health_form/answer_environmental_pollution_form.dart';
import 'package:rcc/screens/form%20design/health_form/complaints_environmental_pollution_form.dart';
import 'package:rcc/screens/form%20design/health_form/medical_reg_form.dart';
import 'package:rcc/screens/form%20design/health_form/premises_registration/premises_registration.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_banner.dart';
import 'package:rcc/widgets/custom_card_text.dart';
import 'package:rcc/widgets/gradient_text.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewGradientAppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 3.0,
            elevation: 15.0,
            leading: const BackButton(),
            title: const Text('স্বাস্থ্য বিভাগ'),
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
                  "স্বাস্থ্য বিভাগ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.to(const PremisesRegistrationFormPage());
                },

                // Get.to(PremisesRegistrationFormPage());
                child:  CustomCardText(
                    title: 'প্রিমিসেস নিবন্ধন',
                    icon: 'assets/images/groupicon2.png'),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const ComplaintsEnvironmentalPollutionForm());
                },
                child: const CustomCardText(
                    title: 'পরিবেশ দূষণ অভিযোগ',
                    icon: 'assets/images/groupicon2.png'),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const AnswerEnvironmentalPollutionForm());
                },
                child: const CustomCardText(
                    title: 'পরিবেশ দূষণ অভিযোগ এর উত্তর',
                    icon: 'assets/images/groupicon2.png'),
              ),
              GestureDetector(
                onTap: (){
                  Get.to(const MedicalRegForm());
                },
                child: const CustomCardText(
                    title: 'মেডিকেল নিবন্ধনকরণ',
                    icon: 'assets/images/groupicon2.png'),
              ),
              GestureDetector(
                onTap: (){
                  Get.to(const AnimalLisencePageForm());
                },
                child: const CustomCardText(
                    title: 'পোষা প্রাণীর লাইসেন্স',
                    icon: 'assets/images/groupicon2.png'),
              ),
            ],
          ),
        ));
  }
}
