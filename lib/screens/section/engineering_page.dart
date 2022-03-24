import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_banner.dart';
import 'package:rcc/widgets/custom_card_text.dart';
import 'package:rcc/widgets/gradient_text.dart';

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
            automaticallyImplyLeading: false,
            titleSpacing: 3.0,
            elevation: 15.0,
            leading: const BackButton(),
            title: const Text('প্রকৌশল বিভাগ'),
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
                  "প্রকৌশল বিভাগ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const CustomCardText(

                  title: 'জল এবং গ্যাস সংযোগ পরিষেবা',
                  icon: 'assets/images/groupicon2.png'),
              const CustomCardText(
                  title: 'যানবাহন / যন্ত্রপাতি ভাড়া',
                  icon: 'assets/images/groupicon2.png'),
              const CustomCardText(
                  title: 'ঠিকাদার লাইসেন্স / তালিকাভুক্ত',
                  icon: 'assets/images/groupicon2.png'),
              const CustomCardText(
                  title: 'ঠিকাদার লাইসেন্স / তালিকাভুক্ত',
                  icon: 'assets/images/groupicon2.png'),
              const CustomCardText(
                  title: 'ভূমি ব্যবহার অনাপত্তি ছাড়পত্রের জন্য আবেদন',
                  icon: 'assets/images/groupicon2.png'),
            ],
          ),
        ));
  }
}
