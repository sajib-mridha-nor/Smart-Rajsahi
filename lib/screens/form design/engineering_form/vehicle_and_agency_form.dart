import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_date_picker.dart';
import 'dart:io';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

class VehicleAgencyFormPage extends StatefulWidget {
  const VehicleAgencyFormPage({Key? key}) : super(key: key);

  @override
  State<VehicleAgencyFormPage> createState() => _VehicleAgencyFormPageState();
}

class _VehicleAgencyFormPageState extends State<VehicleAgencyFormPage> {
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
                  "যানবাহন ও যন্ত্রপাতির ভাড়া সংক্রান্ত আবেদন",
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
                        label: 'ঠিকাদারী প্রতিষ্ঠান/ব্যক্তির নাম',
                        hint: '',
                        onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'কাজের বিবরন', hint: '', onChange: () {}),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'কাজের স্থান', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDatePicker(
                      label: 'কার্যাদেশের তারিখ',
                      hint: 'mm/dd/yyyy',
                      onChange: (value) {},
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'কার্যাদেশ ইস্যুকারী প্রতিষ্ঠানের নাম',
                        hint: '',
                        onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child:
                    CustomDatePicker(
                      label: 'কাজের তারিখ',
                      hint: 'mm/dd/yyyy',
                      onChange: (value) {},
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomDropdown(
                  label: "আবেদনকৃত যানবাহন/যন্ত্রপাতির নাম/ধরন",
                  items: _items,
                  hint: "--------",
                  require: true,
                  onChange: (String? value) {
                    debugPrint("$value");
                  }),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "যানবাহন/যন্ত্রপাতির সংখ্যা",
                        items: _items,
                        hint: "1",
                        require: true,
                        onChange: (String? value) {
                          debugPrint("$value");
                        }),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "যানবাহন/যন্ত্রপাতি ব্যবহারের দিন সংখ্যা",
                        items: _items,
                        hint: "1",
                        require: true,
                        onChange: (String? value) {
                          debugPrint("$value");
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                  maxLines: 6,
                  label:
                      'আবেদনকারীর যানবাহন/যন্ত্রপাতি যে ধরনের কাজে ব্যবহার করা হইবে উহার সংক্ষিপ্ত বিবরণ',
                  hint: '',
                  onChange: () {}),
              const SizedBox(
                height: 8.0,
              ),
              CustomFilePicker(
                label: 'গ্রহণকারীর স্বাক্ষর',
                hint: 'choose File',
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                // require: true,
              ),
              Text('স্ক্যান কপি আপলোড করুন'),
              const SizedBox(
                height: 8.0,
              ),
              CustomFilePicker(
                label: 'অন্য সংস্থার কার্যাদেশ ও শিডিউলের কপি সংযুক্ত করুন',
                hint: 'choose File',
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                // require: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Center(
                child: Text(
                  'হলফনামা',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                'বর্ণিত তথ্যাদি সঠিক। কোন রকম সত্য গোপন করা হয় নাই বা কোন মিথ্যা তথ্য প্রদান করা হয় নাই। পরবর্তীতে কোন বিষয় বা তথ্য স্বপক্ষে মিথ্যা প্রমাণিত হইলে আমার বিরুদ্ধে প্রচলিত আইনে ব্যবস্থা গ্রহণ করা যাইবে।',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomButton(onClick: () {}, title: 'সাবমিট')
            ],
          ),
        ),
      ),
    );
  }
}
