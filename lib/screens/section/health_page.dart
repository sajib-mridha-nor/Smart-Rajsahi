import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
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
              const CustomCardText(
                  title: 'প্রিমিসেস নিবন্ধন',
                  icon: 'assets/images/groupicon2.png'),
              const CustomCardText(
                  title: 'পরিবেশ দূষণ অভিযোগ',
                  icon: 'assets/images/groupicon2.png'),
              const CustomCardText(
                  title: 'পরিবেশ দূষণ অভিযোগ এর উত্তর',
                  icon: 'assets/images/groupicon2.png'),
              const CustomCardText(
                  title: 'মেডিকেল নিবন্ধনকরণ',
                  icon: 'assets/images/groupicon2.png'),
              const CustomCardText(
                  title: 'পোষা প্রাণীর লাইসেন্স',
                  icon: 'assets/images/groupicon2.png'),
            ],
          ),
        ));
  }
}
