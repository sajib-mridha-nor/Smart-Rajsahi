import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_radio_group.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

class ApplyAdvertisementFormPage extends StatefulWidget {
  const ApplyAdvertisementFormPage({Key? key}) : super(key: key);

  @override
  State<ApplyAdvertisementFormPage> createState() =>
      _ApplyAdvertisementFormPageState();
}

class _ApplyAdvertisementFormPageState
    extends State<ApplyAdvertisementFormPage> {
  final _items = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];
  var createApplyAdvertisementDoc = <String, dynamic>{};
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
                child: const GradientText(
                  "বিজ্ঞাপনের জন্য আবেদন (নিবন্ধনকরণ)",
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
                  label: 'রেজিস্ট্রেশান কারির নাম', hint: '',
                  onChange: (value) {
                createApplyAdvertisementDoc["register_name"] =
                    value;
              }
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'আবেদনকারীর নাম', hint: '',
                        onChange: (value) {
                      createApplyAdvertisementDoc["application_name"] =
                          value;
                    }
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'প্রতিষ্ঠানের নাম', hint: '',  onChange: (value) {
                      createApplyAdvertisementDoc["business_name"] =
                          value;
                    }),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'ঠিকানা (বিস্তারিত লিখুন)', hint: '',  onChange: (value) {
                createApplyAdvertisementDoc["about_write"] =
                    value;
              }),
              const SizedBox(
                height: 8,
              ),


              CustomTextField(
                  label: 'ব্যবসা প্রতিষ্ঠানের হোল্ডিং/দোকান নং',
                  hint: '',
                  onChange: (value) {
                    createApplyAdvertisementDoc["business_holding_no"] =
                        value;
                  }),
              const SizedBox(
                height: 8,
              ),
              CustomDropdown(
                  label: "ওয়ার্ড নং",
                  items: _items,
                  hint: "------",
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
                        label: "গ্রাম/মহল্লা",
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
                    child: CustomTextField(
                        label: 'পোস্ট অফিস', hint: '',  onChange: (value) {
                      createApplyAdvertisementDoc["post_office"] =
                          value;
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
                        label: "থানা",
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
                    child: CustomTextField(
                        label: 'জেলা', hint: 'রাজশাহী',  onChange: (value) {
                      createApplyAdvertisementDoc["district_name"] =
                          value;
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
                        label: 'ফোন/মোবাইল নাম্বার',
                        hint: '+0150000000',
                        onChange: (value) {
                          createApplyAdvertisementDoc["mobile_number"] =
                              value;
                        }
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
                      label: "আয়কর আছে কিনা",
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
              CustomDropdown(
                  label: "বিজ্ঞাপনের প্রকৃতি",
                  items: _items,
                  hint: "------",
                  require: true,
                  onChange: (String? value) {
                    debugPrint("$value");
                  }),
              const SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                  label: 'বিজ্ঞাপনের ধরন',
                  hint: 'নির্বাচন করুন',
                  onChange: (value) {
                    createApplyAdvertisementDoc["ad_type"] =
                        value;
                  }),
              const SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                  label:
                      'বিজ্ঞাপনের ধরন (উপরের তালিকাতে না থাকিলে এখানে লিখুন)',
                  hint: '',
                  onChange: (value) {
                    createApplyAdvertisementDoc["ad_types"] =
                        value;
                  }

              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "বিজ্ঞাপনের পরিমাপ (বর্গফুট)",
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
                        label: "বিজ্ঞাপনের সংখ্যা",
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
              CustomTextField(
                  label: 'বিজ্ঞাপন প্রদর্শনের স্থান',
                  hint: '',
                  onChange: (value) {
                    createApplyAdvertisementDoc["ad_show"] =
                        value;
                  }
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "বিজ্ঞাপনের পরিমাপ (বর্গফুট)",
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
                        label: "বিজ্ঞাপনের সংখ্যা",
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
              CustomTextField(
                  label: 'বিজ্ঞাপন প্রদর্শনের স্থান',
                  hint: '',
                  onChange: (value) {
                    createApplyAdvertisementDoc["ad_show_place"] =
                        value;
                  }),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "বিজ্ঞাপনের পরিমাপ (বর্গফুট)",
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
                        label: "বিজ্ঞাপনের সংখ্যা",
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
              CustomTextField(
                  label: 'বিজ্ঞাপন প্রদর্শনের স্থান',
                  hint: '',
                  onChange: (value) {
                    createApplyAdvertisementDoc["ad_place_show"] =
                        value;
                  }),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "বিজ্ঞাপনের পরিমাপ (বর্গফুট)",
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
                        label: "বিজ্ঞাপনের সংখ্যা",
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
              CustomTextField(
                  label: 'বিজ্ঞাপন প্রদর্শনের স্থান',
                  hint: '',
                  onChange: (value) {
                    createApplyAdvertisementDoc["ad_show_place1"] =
                        value;
                  }),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "বিজ্ঞাপনের পরিমাপ (বর্গফুট)",
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
                        label: "বিজ্ঞাপনের সংখ্যা",
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
              CustomTextField(
                  label: 'বিজ্ঞাপন প্রদর্শনের স্থান',
                  hint: '',
                  onChange: (value) {
                    createApplyAdvertisementDoc["ad_show_place2"] =
                        value;
                  }),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "আর্থিক বছর",
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
                    child: CustomDropdown(
                        label: "হালনাগাদ অর্থবছর",
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
              CustomButton(onClick: () {
                print( createApplyAdvertisementDoc.toString());
              }, title: 'সাবমিট')
            ],
          ),
        ),
      ),
    );
  }
}
