import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/home/menu/engineering_form/contractor_form/contractor_license_renewal_form.dart';
import 'package:rcc/screens/home/menu/engineering_form/contractor_form/contractor_license_renewal_second_page_form.dart';
import 'package:rcc/screens/home/menu/engineering_form/land_use_form.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_banner.dart';
import 'package:rcc/widgets/custom_card_text.dart';
import 'package:rcc/widgets/gradient_text.dart';
import '../home/menu/engineering_form/engineering_water_gas_form.dart';
import '../home/menu/engineering_form/vehicle_and_agency_form.dart';


class EngineeringPage extends StatefulWidget {
  const EngineeringPage({Key? key}) : super(key: key);

  @override
  State<EngineeringPage> createState() => _EngineeringPageState();
}

class _EngineeringPageState extends State<EngineeringPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewGradientAppBar(
            title: const Text('প্রকৌশল বিভাগ'),
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
                padding: EdgeInsets.all(8.0),
                child: GradientText(
                  "প্রকৌশল বিভাগ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomCardText(
                title: 'জল এবং গ্যাস সংযোগ পরিষেবা',
                icon: 'assets/images/groupicon2.png',
                onTap: () {
                  Get.to(const EngineeringFormPage());
                },
              ),
              CustomCardText(
                title: 'যানবাহন / যন্ত্রপাতি ভাড়া',
                icon: 'assets/images/groupicon2.png',
                onTap: () {
                  Get.to(const VehicleAgencyFormPage());
                },
              ),
              CustomCardText(
                title: 'ঠিকাদার লাইসেন্স / তালিকাভুক্ত',
                icon: 'assets/images/groupicon2.png',
                onTap: () {
                  Get.to(const ContractorLicenseRenewalFormPage());
                },
              ),
              CustomCardText(
                title: 'ঠিকাদার লাইসেন্স / তালিকাভুক্ত',
                icon: 'assets/images/groupicon2.png',
                onTap: () {
                  Get.to(const ContractorSecondPage());
                },
              ),

              CustomCardText(
                title: 'ভূমি ব্যবহার অনাপত্তি ছাড়পত্রের জন্য আবেদন',
                icon: 'assets/images/groupicon2.png',
                onTap: () {
                  Get.to(const LandUseFormPage());
                },
              ),
            ],
          ),
        ));
  }
}
