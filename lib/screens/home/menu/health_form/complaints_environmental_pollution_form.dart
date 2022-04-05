import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';
import 'dart:io';


class ComplaintsEnvironmentalPollutionForm extends StatefulWidget {
  const ComplaintsEnvironmentalPollutionForm({Key? key}) : super(key: key);

  @override
  State<ComplaintsEnvironmentalPollutionForm> createState() =>
      _ComplaintsEnvironmentalPollutionFormState();
}

class _ComplaintsEnvironmentalPollutionFormState
    extends State<ComplaintsEnvironmentalPollutionForm> {
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
                  "পরিবেশ দূষণ অভিযোগ",
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
              const Center(
                  child: Text('২০০৯ সালের ৯২ নং আইনের ধারা নং ১০,১৪ ও ২৬ বলে')),
              CustomTextField(
                  label: 'রেজিস্ট্রেশান কারির নাম ',
                  hint: 'Jannatul Ferdous',
                  onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'অভিযোগকারীর নাম', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'অভিযোগকারীর মোবাইল', hint: '', onChange: () {}),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              CustomFilePicker(
                label: "অভিযোগ বিষয়ক ছবি",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                  maxLines: 8,
                  label: 'অভিযোগ বিস্তারিত',
                  hint: '',
                  onChange: () {}),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                  label: 'অভিযুক্ত ব্যাক্তি/প্রতিষ্ঠানের নাম',
                  hint: '',
                  onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'অভিযুক্ত ব্যাক্তি/প্রতিষ্ঠানের হোল্ডিং',
                  hint: '',
                  onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              CustomDropdown(
                  label: "অভিযুক্ত ব্যাক্তি/প্রতিষ্ঠানের মোবাইল",
                  items: _items,
                  hint: "",
                  require: true,
                  onChange: (String? value) {
                    debugPrint("$value");
                  }),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'অভিযুক্ত ব্যাক্তি/প্রতিষ্ঠানের মহল্লা',
                  hint: '',
                  onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              CustomButton(onClick: () {}, title: 'সাবমিট')
            ],
          ),
        ),
      ),
    );
  }
}
