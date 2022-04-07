import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/home/menu/revenue_form/holding_tax_review_form.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_banner.dart';
import 'package:rcc/widgets/custom_card_text.dart';
import 'package:rcc/widgets/gradient_text.dart';
import '../home/menu/revenue_form/application_for_shop_transfer.dart';
import '../home/menu/revenue_form/application_rejection_store_form.dart';
import '../home/menu/revenue_form/apply_advertisement_form.dart';
import '../home/menu/revenue_form/apply_for_shop_sublet_form.dart';
import '../home/menu/revenue_form/apply_new_store_allocation_form.dart';
import '../home/menu/revenue_form/new_holding_application.dart';
import '../home/menu/revenue_form/nomination_application_form.dart';
import '../home/menu/revenue_form/pay_shop_rent_form.dart';
import '../home/menu/revenue_form/registration_private_educational_form.dart';
import '../home/menu/revenue_form/renewal_advertisement_form.dart';
import '../home/menu/revenue_form/renewal_private_educational_form.dart';
import '../home/menu/revenue_form/trade_license_new_form.dart';
import '../home/menu/revenue_form/trade_license_renewal_form.dart';

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
                ),
              ),
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
              CustomCardText(
                  onTap: () {
                    Get.to(const TradeLicenseNewFormPage());
                  },
                  title: 'ট্রেড লাইসেন্স নতুন',
                  icon: 'assets/images/groupicon2.png'),
              CustomCardText(
                  onTap: () {
                    Get.to(const TradeLiscenseRenewalFormPage());
                  },
                  title: 'ট্রেড লাইসেন্স নবায়ন',
                  icon: 'assets/images/groupicon2.png'),
              CustomCardText(
                  onTap: () {
                    Get.to(const ApplyAdvertisementFormPage());
                  },
                  title: 'বিজ্ঞাপনের জন্য আবেদন (নিবন্ধনকরণ)',
                  icon: 'assets/images/groupicon2.png'),
              CustomCardText(
                  onTap: () {
                    Get.to(const RenewalAdvertisementFormPage());
                  },
                  title: 'বিজ্ঞাপনের জন্য আবেদন (নবায়ন)',
                  icon: 'assets/images/groupicon2.png'),
              CustomCardText(
                  onTap: () {
                    Get.to(const NewHoldingApplicationFormPage());
                  },
                  title: 'নতুন হোল্ডিং এর জন্য আবেদন',
                  icon: 'assets/images/groupicon2.png'),
              CustomCardText(
                  onTap: () {
                    Get.to(const HoldingTaxReviewFormPage());
                  },
                  title: 'হোল্ডিং ট্যাক্স রিভিউ',
                  icon: 'assets/images/groupicon2.png'),
              CustomCardText(
                  onTap: () {
                    Get.to(const ApplyNewStoreAllocation());
                  },
                  title: 'নতুন দোকান বরাদ্দের জন্য আবেদন',
                  icon: 'assets/images/groupicon2.png'),
              CustomCardText(
                  onTap: () {
                    Get.to(Get.to(const RegistrationPrivateEducationalForm()));
                  },
                  title:
                      'বেসরকারী শিক্ষাপ্রতিষ্ঠানের/কোচিং সেন্টারের নিবন্ধনকরণ',
                  icon: 'assets/images/groupicon2.png'),
              CustomCardText(
                  onTap: () {
                    Get.to(const NominationApplicationFormPage());
                  },
                  title: 'নামজারি আবেদন (হোল্ডিং)',
                  icon: 'assets/images/groupicon2.png'),
              CustomCardText(
                  onTap: () {
                    Get.to(const RenewalPrivateEducationalFormPage());
                  },
                  title: 'বেসরকারী শিক্ষাপ্রতিষ্ঠানের/কোচিং সেন্টারের নবায়ন',
                  icon: 'assets/images/groupicon2.png'),
              CustomCardText(
                  onTap: () {
                    Get.to(const PayShopRentFormPage());
                  },
                  title: 'দোকান ভাড়া পরিশোধ',
                  icon: 'assets/images/groupicon2.png'),
              CustomCardText(
                  onTap: () {
                    Get.to(const ApplyShopSubletFormPage());
                  },
                  title: 'দোকান সাবলেটের জন্য আবেদন',
                  icon: 'assets/images/groupicon2.png'),
              CustomCardText(
                  onTap: () {
                    Get.to(const ApplicationShopTransferFormPage());
                  },
                  title: 'দোকান হস্তান্তরের জন্য আবেদন',
                  icon: 'assets/images/groupicon2.png'),
              CustomCardText(
                  onTap: () {
                    // Get.to(PremisesRegistrationFormPage());
                    Get.to(const ApplicationRejectionStoreFormPage());
                  },
                  title: 'দোকান নাম খারিজের জন্য আবেদন',
                  icon: 'assets/images/groupicon2.png'),
            ],
          ),
        ));
  }
}
