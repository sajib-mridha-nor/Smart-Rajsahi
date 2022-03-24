import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_banner.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

class EngineeringFormPage extends StatefulWidget {
  const EngineeringFormPage({Key? key}) : super(key: key);

  @override
  State<EngineeringFormPage> createState() => _EngineeringFormPageState();
}

class _EngineeringFormPageState extends State<EngineeringFormPage> {
  final _items = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];

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
            const SizedBox(
              height: 8.0,
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: const GradientText(
                "জল এবং গ্যাস সংযোগ পরিষেবা",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(
              thickness: 1,
              indent: 9.0,
              color: Colors.grey,
              endIndent: 12.0,
            ),

            CustomTextField(
                label: 'বর্তমান পানি সংযোগ এর ঠিকানা',
                hint: 'Jannatul Ferdous',
                onChange: () {}),

            // SizedBox(
            //   height: 30.0,
            // ),
            CustomTextField(label: 'হোল্ডিং নং', hint: '', onChange: () {}),

            CustomDropdown(
                label: "নির্বাচন করুন",
                items: _items,
                hint: "নির্বাচন করুন",
                require: true,
                onChange: (String? value) {
                  debugPrint("$value");
                }),
          ],
        ),
      ),
    );
  }
}
