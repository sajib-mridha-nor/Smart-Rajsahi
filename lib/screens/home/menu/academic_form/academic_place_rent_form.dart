import 'dart:io';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_date_picker.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

class AcademicPlaceRentForm extends StatefulWidget {
  const AcademicPlaceRentForm({Key? key}) : super(key: key);

  @override
  State<AcademicPlaceRentForm> createState() => _AcademicPlaceRentFormState();
}

class _AcademicPlaceRentFormState extends State<AcademicPlaceRentForm> {
  final _items = [
    "00",
    "10",
    "20",
    "40",
    "50",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 3.0,
          elevation: 15.0,
          leading: const BackButton(),
          title: const Text('প্রশাসনিক বিভাগ'),
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
                onTap: () {
                  // Get.to(const EngineeringFormPage());
                },
                child: Container(
                  // margin: const EdgeInsets.all(10.0),
                  child: const GradientText(
                    "সিটি কর্পোরেশনের জায়গা ভাড়া",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                indent: 1.0,
                color: Colors.grey,
                endIndent: 12.0,
              ),
              CustomTextField(
                  label: 'রেজিস্ট্রেশান কারির নাম ',
                  hint: 'Jannatul Ferdous',
                  onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                label: 'জায়গার নাম ',
                hint: '',
                onChange: () {},
              ),
              CustomDatePicker(
                label: 'তারিখ',
                hint: 'mm/dd/yyyy',
                onChange: (value) {},
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                  maxLines: 6,
                  label: 'জায়গা ভাড়ার  কারণ বিস্তারিত লিখুন  ',
                  hint: 'এখানে লিখুন',
                  onChange: () {}),
              const SizedBox(
                height: 32.0,
              ),
              CustomFilePicker(
                label: 'সংযুক্ত কাগজ',
                hint: 'choose File',
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                // require: true,
              ),
              const SizedBox(
                height: 32.0,
              ),
              CustomButton(onClick: () {}, title: 'সাবমিট')
            ],
          ),
        ),
      ),
    );
  }
}
