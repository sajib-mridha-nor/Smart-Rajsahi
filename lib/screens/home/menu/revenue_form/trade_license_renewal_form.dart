import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_date_picker.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_radio_group.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';
import 'dart:io';

class TradeLiscenseRenewalFormPage extends StatefulWidget {
  const TradeLiscenseRenewalFormPage({Key? key}) : super(key: key);

  @override
  State<TradeLiscenseRenewalFormPage> createState() =>
      _TradeLiscenseRenewalFormPageState();
}

class _TradeLiscenseRenewalFormPageState
    extends State<TradeLiscenseRenewalFormPage> {
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
              GestureDetector(
                onTap: () {},

                // margin: const EdgeInsets.all(10.0),
                child: const GradientText(
                  "ট্রেড লাইসেন্স নবায়নের জন্য আবেদন",
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
                  label: 'নবায়ন কারির নাম ',
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
                        label: 'মালিকের নাম', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'স্থায়ী ঠিকানা (বিস্তারিত লিখুন)',
                        hint: '',
                        onChange: () {}),
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
                        label: 'ব্যবসা প্রতিষ্ঠানের নাম',
                        hint: '',
                        onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'ব্যবসার স্থান (বিস্তারিত লিখুন)',
                        hint: '',
                        onChange: () {}),
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
                        label: 'পূর্বের লাইসেন্স নং',
                        hint: '',
                        onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDatePicker(
                      label: 'পূর্বের লাইসেন্স এর মেয়াদ',
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
                    child: CustomDropdown(
                        label: "ব্যাবসায়ের প্রকৃতি",
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
                        label: "ব্যবসায়ের ধরন",
                        items: _items,
                        hint: "নির্বাচন করুন",
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
                        label: "ব্যাবসায়ের প্রকৃতি",
                        items: _items,
                        hint: "",
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
                        label: "ব্যবসায়ের ধরন",
                        items: _items,
                        hint: "নির্বাচন করুন",
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
                        label: "ব্যাবসায়ের প্রকৃতি",
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
                        label: "ব্যবসায়ের ধরন",
                        items: _items,
                        hint: "নির্বাচন করুন",
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
                  label:
                      'ব্যবসায়ের ধরন (উপরের তালিকাতে না থাকিলে এখানে লিখুন))',
                  hint: '',
                  onChange: () {}),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomRadioGroup(
                      initialValue: "Pen ding",
                      items: const ["নিজের", "ভাড়ার"],
                      label: "রেজিস্ট্রেশান কারির নাম",
                      onChange: (index, value) {
                        debugPrint("index $index, Value $value");
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "সাইনবোর্ড (স্কয়ার ফিট)",
                        items: _items,
                        hint: "",
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
              CustomFilePicker(
                label:
                    "স্থানটি নিজস্ব হলে কর্পোরেশনের হালনাগাদ ট্যাক্সের রশিদ এবং ভাড়া হলে তার রশিদ",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                  label: 'হোল্ডিং/দোকান নং (ব্যবসার প্রতিষ্ঠানের)',
                  hint: '',
                  onChange: () {}),
              const SizedBox(
                width: 8.0,
              ),
              CustomDatePicker(
                label: 'ব্যবসা আরম্ভ করার তারিখ',
                hint: 'mm/dd/yyyy',
                onChange: (value) {},
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "ব্যবসা প্রতিষ্ঠানের ওয়ার্ড নং",
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
                        label: "ব্যবসা প্রতিষ্ঠানের থানা",
                        items: _items,
                        hint: "নির্বাচন করুন",
                        require: true,
                        onChange: (String? value) {
                          debugPrint("$value");
                        }),
                  ),
                ],
              ),
              const SizedBox(
                width: 8.0,
              ),
              CustomTextField(
                  maxLines: 8,
                  label:
                      'ব্যবসার ধরণ / মালিকানার কোন রকম পরিবর্তন বা পরিবর্ধন করার প্রয়োজন হলে তার বিস্তারিত তথ্য',
                  hint: '',
                  onChange: () {}),
              const SizedBox(
                width: 8.0,
              ),
              CustomFilePicker(
                label: "উৎস কর এর কপি (ছবি/পিডিএফ) সংযুক্ত করুন",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                "যদি আয়কর থাকে তবে টিন (TIN) নাম্বার অথবা টিন নাম্বার এর ছবি সংযুক্ত করুন",
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
                height: 8.0,
              ),
              CustomRadioGroup(
                initialValue: "Pen ding",
                items: const ["হ্যাঁ", "না"],
                label: "আয়কর আছে কিনা",
                onChange: (index, value) {
                  debugPrint("index $index, Value $value");
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                "Business Identification Number (BIN) যদি থাকে",
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
                height: 8.0,
              ),
              CustomRadioGroup(
                initialValue: "Pen ding",
                items: const ["হ্যাঁ", "না"],
                label: "BIN (Business Identification Number) আছে কিনা",
                onChange: (index, value) {
                  debugPrint("index $index, Value $value");
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                "যদি প্রতিষ্ঠান/কারখানা/কোম্পানি লিমিটেড হয়ে থাকে",
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
                height: 8.0,
              ),
              CustomRadioGroup(
                initialValue: "Pen ding",
                items: const ["হ্যাঁ", "না"],
                label: "প্রতিষ্ঠান/কারখানা/কোম্পানি (লিমিটেড) সীমাবদ্ধ কিনা",
                onChange: (index, value) {
                  debugPrint("index $index, Value $value");
                },
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
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const SizedBox(
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
