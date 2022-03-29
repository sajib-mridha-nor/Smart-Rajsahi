import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_date_picker.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';
import 'dart:io';

class NominationApplicationFormPage extends StatefulWidget {
  const NominationApplicationFormPage({Key? key}) : super(key: key);

  @override
  State<NominationApplicationFormPage> createState() =>
      _NominationApplicationFormPageState();
}

class _NominationApplicationFormPageState
    extends State<NominationApplicationFormPage> {
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
                  "নামজারি আবেদন (হোল্ডিং)",
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
                  label: 'রেজিস্ট্রেশান কারির নাম:', hint: '', onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'হোল্ডিং/বাড়ির নং', hint: '', onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "যে হোল্ডিং টির ক্ষেত্রে নামজারি করা হইবে",
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
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'হোল্ডিং/বাড়ির নং', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "ওয়ার্ড নং",
                        items: _items,
                        hint: "------",
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
                        label: "মহল্লার নাম",
                        items: _items,
                        hint: "------",
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
                    child: CustomDropdown(
                        label: "ষোল আনা/আংশিক",
                        items: _items,
                        hint: "নির্বাচন করুন",
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
                    child: CustomTextField(
                        label: 'জমির পরিমাণ', hint: '', onChange: () {}),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "কি প্রকার দলিল নথিপত্র নামজারির জন্য জমা দেওয়া হইল",
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
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomFilePicker(
                      label: "খরিদ সূত্রের দলিল",
                      hint: "Choose File",
                      onChange: (File file) {
                        debugPrint("${file.path}");
                      },
                      require: true,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomFilePicker(
                      label: "ওয়ারিশ সূত্রে প্রত্যয়নপত্র",
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
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomFilePicker(
                      label: "আদালত কর্তৃক ডিগ্রী বা সাকসেশন সার্টিফিকেট",
                      hint: "Choose File",
                      onChange: (File file) {
                        debugPrint("${file.path}");
                      },
                      require: true,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomFilePicker(
                      label: "হেবা এওয়াজনাম দলিল",
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
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomFilePicker(
                      label: "সোলেনামা অনুমোদিত দলিল",
                      hint: "Choose File",
                      onChange: (File file) {
                        debugPrint("${file.path}");
                      },
                      require: true,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomFilePicker(
                      label: "দানসূত্রের দলিল",
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
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomFilePicker(
                      label: "সংশোধিত দলিল",
                      hint: "Choose File",
                      onChange: (File file) {
                        debugPrint("${file.path}");
                      },
                      require: true,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomFilePicker(
                      label: "লিজ দলিল",
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
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomFilePicker(
                      label: "সি. এস. পর্চা",
                      hint: "Choose File",
                      onChange: (File file) {
                        debugPrint("${file.path}");
                      },
                      require: true,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomFilePicker(
                      label: "আর. এস. পর্চা",
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
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomFilePicker(
                      label: "এস. এ. পর্চা",
                      hint: "Choose File",
                      onChange: (File file) {
                        debugPrint("${file.path}");
                      },
                      require: true,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomFilePicker(
                      label: "ডিসিআর/বি. এস. পর্চা",
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
                height: 8.0,
              ),
              CustomFilePicker(
                label: "খাজনার রশিদ (হাল নাগাদ)",
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
                label: "ইমারতের ছবি সংযুক্ত করতে হবে (ইমেজ ফাইল)",
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
                "বকেয়া পৌরকর সহ চলতি কিস্তির কর থাকলে",
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
                    child: CustomFilePicker(
                      label: "রশিদ / বিল নং",
                      hint: "Choose File",
                      onChange: (File file) {
                        debugPrint("${file.path}");
                      },
                      require: true,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDatePicker(
                      label: 'তারিখ',
                      hint: 'mm/dd/yyyy',
                      onChange: (value) {},
                    ),
                  ),
                ],
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
