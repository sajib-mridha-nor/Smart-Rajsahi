import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

class HoldingTaxReviewFormPage extends StatefulWidget {
  const HoldingTaxReviewFormPage({Key? key}) : super(key: key);

  @override
  State<HoldingTaxReviewFormPage> createState() =>
      _HoldingTaxReviewFormPageState();
}

class _HoldingTaxReviewFormPageState extends State<HoldingTaxReviewFormPage> {
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
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 8.0,
              ),
              GestureDetector(
                onTap: () {},

                // margin: const EdgeInsets.all(10.0),
                child: const GradientText(
                  "ট্যাক্স রিভিউ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                indent: 1.0,
                color: Colors.grey,
                endIndent: 12.0,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: '',
                  hint:
                      'অ্যাপ্লিকেশন আইডি অথবা হোল্ডিং নম্বর দিয়ে অনুসন্ধান করুন',
                  onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomButton(onClick: () {}, title: 'সার্চ করুন')
            ],
          ),
        ),
      ),
    );
  }
}
