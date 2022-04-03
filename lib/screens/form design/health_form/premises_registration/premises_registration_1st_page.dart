import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';
import 'dart:io';

class PremisesRegistrationFirstPage extends StatefulWidget {
  const PremisesRegistrationFirstPage({Key? key}) : super(key: key);

  @override
  State<PremisesRegistrationFirstPage> createState() =>
      _PremisesRegistrationFirstPageState();
}

class _PremisesRegistrationFirstPageState
    extends State<PremisesRegistrationFirstPage> {
  @override
  Widget build(BuildContext context) {
    final _items = [
      "1",
      "2",
      "3",
      "4",
      "5",
    ];
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
                  "প্রিমিসেস রেজিস্ট্রেশন",
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
                height: 8.0,
              ),
              const Text(
                  '২০০৫ সনের ২৭ নং আইন দ্বারা সংশোধিত বাংলাদেশ বিশুদ্ধ খাদ্য অধ্যাদেশ ১৯৫৯ এর ২১(১) ও (২) ধারা অনুযায়ী'),
              const SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                  label: 'রেজিস্ট্রেশান কারির নাম ',
                  hint: 'Jannatul Ferdous',
                  onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'ব্যবসা প্রতিষ্ঠান নাম ', hint: '', onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "ষোল আনা/আংশিক",
                        items: _items,
                        hint: "-----",
                        require: true,
                        onChange: (String? value) {
                          debugPrint("$value");
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "ব্যবসার ধরন",
                        items: _items,
                        hint: "-----",
                        require: true,
                        onChange: (String? value) {
                          debugPrint("$value");
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'মালিকের নাম', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomFilePicker(
                      label: "আবেদনকারীর ছবি",
                      hint: "Choose File",
                      onChange: (File file) {
                        debugPrint("${file.path}");
                      },
                      require: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'মালিকের পিতা/স্বামী/অভিবাবক এর নাম',
                  hint: '',
                  onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'মালিকের মাতার নাম', hint: '', onChange: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
