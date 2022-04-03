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
class ApplicationRejectionStoreFormPage extends StatefulWidget {
  const ApplicationRejectionStoreFormPage({Key? key}) : super(key: key);

  @override
  State<ApplicationRejectionStoreFormPage> createState() => _ApplicationRejectionStoreFormPageState();
}

class _ApplicationRejectionStoreFormPageState extends State<ApplicationRejectionStoreFormPage> {
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
              const GradientText(
                "দোকান নাম খারিজের জন্য আবেদন",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
                  label: 'রেজিস্ট্রেশান কারির নাম:', hint: '', onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'আবেদনকারীর/ আবেদনকারীগণের নাম',
                  hint: '',
                  onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'পিত/স্বামীর নাম', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'মাতার নাম', hint: '', onChange: () {}),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'দোকানের অবস্থান', hint: '', onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "মার্কেটের নাম",
                        items: _items,
                        hint: "------",
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
                        label: "দোকান নং",
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
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "ফ্লোর নাম্বার",
                        items: _items,
                        hint: "1",
                        require: true,
                        onChange: (String? value) {
                          debugPrint("$value");
                        }),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'ব্যাবসার ধরেন', hint: '', onChange: () {}),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                  label: 'দোকানের ব্যাবহার', hint: '', onChange: () {}),
              const SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                  keyboardType: TextInputType.number,
                  label: 'মোবাইল/টেলিফোন নাম্বার (যদি থাকে)',
                  hint: '',
                  onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "স্থায়ী ঠিকানা",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'গ্রাম/মহল্লার নাম', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'পোস্ট অফিস', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'উপজেলা/থানা', hint: '', onChange: () {}),
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
                        label: 'হোল্ডিং নং', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "ওয়ার্ড নং",
                        items: _items,
                        hint: "1",
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
                    child: CustomTextField(
                        label: 'জেলা', hint: 'রাজশাহী', onChange: () {}),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "বর্তমান ঠিকানা",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'গ্রাম/মহল্লার নাম', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'পোস্ট অফিস', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'উপজেলা/থানা', hint: '', onChange: () {}),
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
                        label: 'হোল্ডিং নং', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "ওয়ার্ড নং",
                        items: _items,
                        hint: "1",
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
                    child: CustomTextField(
                        label: 'জেলা', hint: 'রাজশাহী', onChange: () {}),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),


              CustomFilePicker(
                label:
                "আবেদনকারীর/ আবেদনকারীগণের স্বাক্ষর (স্ক্যান কপি আপলোড করুন)",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
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
              CustomButton(onClick: () {}, title: 'সাবমিট')
            ],
          ),
        ),
      ),
    );
  }
}
