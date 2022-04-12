import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'dart:io';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
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
  var createEngineeringFormPageDoc = <String, dynamic>{};

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
                onTap: () {
                  Get.to(const EngineeringFormPage());
                },

                // margin: const EdgeInsets.all(10.0),
                child: const GradientText(
                  "বর্তমান পানি সংযোগের ঠিকানা",
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
              // CustomTextField(
              //     label: 'বর্তমান পানি সংযোগ এর ঠিকানা',
              //     hint: '',
              //     onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'হোল্ডিং নং',
                        hint: '',
                        onChange: (value) {
                          createEngineeringFormPageDoc["holding_no"] = value;
                        }

                        ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "ওয়ার্ড নং",
                        items: _items,
                        hint: "1",
                        require: true,
                        onChange: (value) {
                          createEngineeringFormPageDoc["ward_no"] = value;
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'মহল্লার নাম',
                        hint: 'আদুবুড়ি',
                        onChange: (value) {
                          createEngineeringFormPageDoc["village_name"] = value;
                        }),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "থানা",
                        items: _items,
                        hint: "রাজপাড়া থানা",
                        require: true,
                        onChange: (value) {
                          createEngineeringFormPageDoc["thana_name"] = value;
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                  maxLines: 6,
                  label: 'সাইটের নিকটস্থ রাস্তার বিবরণ  ',
                  hint: 'এখানে লিখুন',
                  onChange: (value) {
                    createEngineeringFormPageDoc["site_about"] = value;
                  }),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'রাস্তার নাম',
                        hint: '',
                        onChange: (value) {
                          createEngineeringFormPageDoc["road_name"] = value;
                        }),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'অবস্থান',
                        hint: '',
                        onChange: (value) {
                          createEngineeringFormPageDoc["place"] = value;
                        }),
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
                        label: 'মূল সড়ক হইতে দুরুত্ব',
                        hint: '',
                        onChange: (value) {
                          createEngineeringFormPageDoc["road_distance"] = value;
                        }),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'বিস্তার/প্রশস্ত',
                        hint: '',
                        onChange: (value) {
                          createEngineeringFormPageDoc["expansion"] = value;
                        }),
                  ),
                ],
              ),
              const Text('১০০ মিটার অথবা ১ কিলোমিটার'),
              const Text(
                'সংযুক্ত :',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const Divider(
                thickness: 1,
                indent: 1.0,
                color: Colors.orange,
                endIndent: 12.0,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomFilePicker(
                label: 'এনআইডি কপি সংযুক্ত করুন',
                hint: 'choose File',
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                // require: true,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomFilePicker(
                label: 'রাজশাহী ওয়াসা কর্তৃক প্রদেয় ডিমান্ড নোট',
                hint: 'choose File',
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                // require: true,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomFilePicker(
                label:
                    'রাজশাহী সিটি কর্পোরেশন কর্তৃক প্রদেয় হাল নাগাদ হোল্ডিং কর পরিশোধের রশিদ',
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
              CustomButton(
                  onClick: () {
                    print(createEngineeringFormPageDoc.toString());
                  },
                  title: 'সাবমিট')
            ],
          ),
        ),
      ),
    );
  }
}
