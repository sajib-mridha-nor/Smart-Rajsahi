import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_radio_group.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';
import 'dart:io';

class PayShopRentFormPage extends StatefulWidget {
  const PayShopRentFormPage({Key? key}) : super(key: key);

  @override
  State<PayShopRentFormPage> createState() => _PayShopRentFormPageState();
}

class _PayShopRentFormPageState extends State<PayShopRentFormPage> {
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
                  "বেসরকারী শিক্ষাপ্রতিষ্ঠানের/কোচিং সেন্টারের নবায়ন",
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
              const Text(
                "সাধারণ তথ্য",
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
                        label: 'হোল্ডিং নাম্বার', hint: '', onChange: () {}),
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
                        label: "থানা",
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
                        label: "জেলা",
                        items: _items,
                        hint: "রাজশাহী",
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
              const Text(
                "শিক্ষাপ্রতিষ্ঠানের তথ্য",
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
                        label: 'শিক্ষাপ্রতিষ্ঠানের নাম',
                        hint: '',
                        onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'প্রতিষ্ঠান স্থান (এলাকার নাম)',
                        hint: '',
                        onChange: () {}),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                  label: 'শিক্ষাপ্রতিষ্ঠানের ঠিকানা (বিস্তারিত লিখুন)',
                  hint: '',
                  onChange: () {}),
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
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "ওয়ার্ড নং",
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
              CustomDropdown(
                  label: "প্রতিষ্ঠানের ধরণ",
                  items: _items,
                  hint: "-----",
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
                    child: CustomTextField(
                        label: 'পূর্বের নিবন্ধন নং', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomFilePicker(
                      label: 'পূর্বের নিবন্ধন সন',
                      hint: 'mm/dd/yyyy',
                      onChange: (value) {},
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomRadioGroup(
                      initialValue: "Pen ding",
                      items: const ["নিজের", "ভাড়ার"],
                      label: "প্রতিষ্ঠান স্থান নিজের না ভাড়ার",
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
                    child: CustomRadioGroup(
                      initialValue: "Pen ding",
                      items: const ["হ্যাঁ", "না"],
                      label: "কমপক্ষে তিন সদস্য বিশিষ্ট পরিষদ আছে কিনা",
                      onChange: (index, value) {
                        debugPrint("index $index, Value $value");
                      },
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
                      label:
                          "শিক্ষাপ্রতিষ্ঠাটি নিজের হলে হালনাগাদ ট্যাক্সের রশিদ ভাড়ার হলে চুক্তি পত্র দাখিল করতে হবে",
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
                      label:
                          "শিক্ষাপ্রতিষ্ঠাটি নিজের হলে হালনাগাদ ট্যাক্সের রশিদ ভাড়ার হলে চুক্তি পত্র দাখিল করতে হবে",
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
                    child: CustomDropdown(
                        label: "হাল নাগাদ ট্রেড লাইসেন্স নাম্বার",
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
                        label: "ছাত্র-ছাত্রী সংখ্যা",
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
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomRadioGroup(
                      initialValue: "Pen ding",
                      items: const ["হ্যাঁ", "না"],
                      label: "স্বাস্থ্য সম্মত পরিচ্ছন্ন পরিবেশ আছে কিনা",
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
                    child: CustomRadioGroup(
                      initialValue: "Pen ding",
                      items: const ["হ্যাঁ", "না"],
                      label: "গাড়ি পার্কিং করার ব্যবস্থা আছে কিনা",
                      onChange: (index, value) {
                        debugPrint("index $index, Value $value");
                      },
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
                    child: CustomRadioGroup(
                      initialValue: "Pen ding",
                      items: const ["হ্যাঁ", "না"],
                      label: "ছাত্র ছাত্রীর অভিভাবকের বসার ব্যবস্থা আছে কিনা",
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
                    child: CustomRadioGroup(
                      initialValue: "Pen ding",
                      items: const ["হ্যাঁ", "না"],
                      label: "পাঠদানের ভবনটি ঝুঁকিপূর্ণ কিনা",
                      onChange: (index, value) {
                        debugPrint("index $index, Value $value");
                      },
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
                    child: CustomRadioGroup(
                      initialValue: "Pen ding",
                      items: const ["হ্যাঁ", "না"],
                      label: "প্রাথমিক চিকিৎসার ব্যবস্থা আছে কিনা",
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
                    child: CustomRadioGroup(
                      initialValue: "Pen ding",
                      items: const ["হ্যাঁ", "না"],
                      label: "শিক্ষকদের বায়োডাটা রেজিস্টারে লিপিবদ্ধ আছে কিনা",
                      onChange: (index, value) {
                        debugPrint("index $index, Value $value");
                      },
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
