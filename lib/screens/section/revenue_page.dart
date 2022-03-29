import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/form%20design/revenue_form/apply_advertisement_form.dart';
import 'package:rcc/screens/form%20design/revenue_form/registration_private_educational_form.dart';
import 'package:rcc/screens/form%20design/revenue_form/renewal_advertisement_form.dart';
import 'package:rcc/screens/form%20design/revenue_form/trade_license_new_form.dart';
import 'package:rcc/screens/form%20design/revenue_form/trade_license_renewal_form.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_banner.dart';
import 'package:rcc/widgets/custom_card_text.dart';
import 'package:rcc/widgets/gradient_text.dart';

class RevenuePage extends StatefulWidget {
  const RevenuePage({Key? key}) : super(key: key);

  @override
  State<RevenuePage> createState() => _RevenuePageState();
}

class _RevenuePageState extends State<RevenuePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewGradientAppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 3.0,
            elevation: 15.0,
            leading: const BackButton(),
            title: const Text('রাজস্ব বিভাগ'),
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
                  "রাজস্ব বিভাগ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const TradeLicenseNewFormPage());
                },
                child: const CustomCardText(
                    title: 'ট্রেড লাইসেন্স নতুন',
                    icon: 'assets/images/groupicon2.png'),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const TradeLiscenseRenewalFormPage());
                },
                child: const CustomCardText(
                    title: 'ট্রেড লাইসেন্স নবায়ন',
                    icon: 'assets/images/groupicon2.png'),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const ApplyAdvertisementFormPage());
                },
                child: const CustomCardText(
                    title: 'বিজ্ঞাপনের জন্য আবেদন (নিবন্ধনকরণ)',
                    icon: 'assets/images/groupicon2.png'),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const RenewalAdvertisementFormPage());
                },
                child: const CustomCardText(
                    title: 'বিজ্ঞাপনের জন্য আবেদন (নবায়ন)',
                    icon: 'assets/images/groupicon2.png'),
              ),
              const CustomCardText(
                  title: 'নামজারি আবেদন (হোল্ডিং)',
                  icon: 'assets/images/groupicon2.png'),
              const CustomCardText(
                  title: 'নতুন হোল্ডিং এর জন্য আবেদন',
                  icon: 'assets/images/groupicon2.png'),
              const CustomCardText(
                  title: 'হোল্ডিং ট্যাক্স রিভিউ',
                  icon: 'assets/images/groupicon2.png'),
              GestureDetector(
                onTap: () {
                  Get.to(Get.to(const RegistrationPrivateEducationalForm()));
                },
                child: const CustomCardText(
                    title:
                        'বেসরকারী শিক্ষাপ্রতিষ্ঠানের/কোচিং সেন্টারের নিবন্ধনকরণ',
                    icon: 'assets/images/groupicon2.png'),
              ),
              const CustomCardText(
                  title: 'নামজারি আবেদন (হোল্ডিং)',
                  icon: 'assets/images/groupicon2.png'),
              const CustomCardText(
                  title: 'বেসরকারী শিক্ষাপ্রতিষ্ঠানের/কোচিং সেন্টারের নবায়ন',
                  icon: 'assets/images/groupicon2.png'),
            ],
          ),
        ));
  }
}
