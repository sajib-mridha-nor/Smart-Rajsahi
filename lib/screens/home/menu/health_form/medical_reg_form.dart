import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_date_picker.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_radio_group.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';
import 'dart:io';

import '../../../../widgets/custom_dropdown.dart';

class MedicalRegForm extends StatefulWidget {
  const MedicalRegForm({Key? key}) : super(key: key);

  @override
  State<MedicalRegForm> createState() => _MedicalRegFormState();
}

class _MedicalRegFormState extends State<MedicalRegForm> {
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
                  "মেডিকেল রেজিস্ট্রেশন",
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
                        label: "মিডিকালের প্রকৃতি",
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
              const SizedBox(
                height: 8,
              ),
              const GradientText(
                "মালিকের ঠিকানা (স্থায়ী)",
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
              const SizedBox(
                height: 8.0,
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
                    child: CustomTextField(
                        label: 'রাস্তার নাম', hint: '', onChange: () {}),
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
                    child: CustomDropdown(
                        label: "ওয়ার্ড নং",
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
                    child: CustomTextField(
                        label: 'মহল্লার নাম', hint: '', onChange: () {}),
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
                        label: 'ব্লক', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'থানা', hint: '', onChange: () {}),
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
                        label: 'পোস্ট অফিস', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "পোস্ট কোড",
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
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'জেলা', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'ফোন/মোবাইল', hint: '', onChange: () {}),
                  ),
                ],
              ),
              const GradientText(
                "মালিকের ঠিকানা (বর্তমান)",
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
                    child: CustomTextField(
                        label: 'রাস্তার নাম', hint: '', onChange: () {}),
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
                    child: CustomDropdown(
                        label: "ওয়ার্ড নং",
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
                    child: CustomTextField(
                        label: 'মহল্লার নাম', hint: '', onChange: () {}),
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
                        label: 'ব্লক', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'থানা', hint: '', onChange: () {}),
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
                        label: 'পোস্ট অফিস', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "পোস্ট কোড",
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
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'জেলা', hint: 'রাজশাহী', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'ফোন/মোবাইল', hint: '', onChange: () {}),
                  ),
                ],
              ),
              const GradientText(
                "ব্যক্তি, ব্যবসা এবং প্রতিষ্ঠানের তথ্য",
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
              CustomDatePicker(
                label: "ব্যবসা আরম্ভ করার তারিখ",
                hint: "",
                onChange: (value) {},
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'প্রিমিসেস নিবন্ধিকরন ব্যবহারের উদ্দেশ্য',
                  hint: '',
                  onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomRadioGroup(
                      initialValue: "Pending",
                      items: const ["পাকা/ফ্লাট", "আধাপাকা", "কাঁচা/ফাঁকা"],
                      label: "প্রতিষ্ঠান কাঠামো",
                      onChange: (index, value) {
                        debugPrint("index $index, Value $value");
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomRadioGroup(
                      initialValue: "Pending",
                      items: const ["ওয়াসা", "টিউবয়েল", "সাবমার্সিবল"],
                      label: "রপানি সরবরাহের প্রকৃতি",
                      onChange: (index, value) {
                        debugPrint("index $index, Value $value");
                      },
                    ),
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
                    child: CustomRadioGroup(
                      initialValue: "Pending",
                      items: const [
                        "হ্যাঁ",
                        "না",
                      ],
                      label: "পর্যাপ্ত আলো-বাতাস চলাচল",
                      onChange: (index, value) {
                        debugPrint("index $index, Value $value");
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomRadioGroup(
                      initialValue: "Pending",
                      items: const [
                        "হ্যাঁ",
                        "না",
                      ],
                      label: "দুর্গন্ধ বের হওয়ার ব্যবস্থা আছে",
                      onChange: (index, value) {
                        debugPrint("index $index, Value $value");
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'নিষ্কাশন/আবর্জনা নিয়ন্ত্রণ ব্যবস্থার সার্বিক অবস্থা',
                  hint: '',
                  onChange: () {}),
              CustomTextField(
                  maxLines: 6, label: 'মন্তব্য', hint: '', onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              const GradientText(
                "সংযুক্ত কাগজপত্রের তালিকা",
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
              CustomFilePicker(
                label: "ভাড়া/লিজ/মালিক রশিদ এর কপি",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomFilePicker(
                label: "পুরাতন লাইসেন্স নবায়ন এর কপি",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomFilePicker(
                label: "মালিকের জন্ম নিবন্ধন/এনআইডি এর কপি",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomFilePicker(
                label: "বিএসটিআই অনুমোদনের কপি (প্রযোজ্য ক্ষেত্রে)",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomFilePicker(
                label: "নাগরিকত্বের সনদ পত্রের কপি",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomFilePicker(
                label: "পানি সংযোগের কপি (প্রযোজ্য ক্ষেত্রে)",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomFilePicker(
                label:
                    "পরিবেশ অধিদপ্তর কর্তৃক অনুমোদনে কপি (প্রযোজ্য ক্ষেত্রে)",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomFilePicker(
                label:
                    "হেলথ সংক্রান্ত কোন জটিলতা থাকলে তার কপি (প্রযোজ্য ক্ষেত্রে)",
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
              const Text(
                'বর্ণিত তথ্যাদি সঠিক। কোন রকম সত্য গোপন করা হয় নাই বা কোন মিথ্যা তথ্য প্রদান করা হয় নাই। পরবর্তীতে কোন বিষয় বা তথ্য স্বপক্ষে মিথ্যা প্রমাণিত হইলে আমার বিরুদ্ধে প্রচলিত আইনে ব্যবস্থা গ্রহণ করা যাইবে।',
                style: TextStyle(
                  fontSize: 14.0,
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
