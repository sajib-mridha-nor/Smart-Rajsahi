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

class NewHoldingApplicationFormPage extends StatefulWidget {
  const NewHoldingApplicationFormPage({Key? key}) : super(key: key);

  @override
  State<NewHoldingApplicationFormPage> createState() =>
      _NewHoldingApplicationState();
}

class _NewHoldingApplicationState extends State<NewHoldingApplicationFormPage> {
  final _items = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];
  var createNewHoldingPageDoc = <String, dynamic>{};

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
                  "নতুন হোল্ডিং এর জন্য আবেদন",
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
                  label: 'রেজিস্ট্রেশান কারির নাম:',
                  hint: '',
                  onChange: (value) {
                    createNewHoldingPageDoc["application_name"] = value;
                  }),
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
                        label: "মহল্লা",
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
              CustomTextField(
                  label: 'প্লট নাম্বার (যদি থাকে)',
                  hint: '',
                  onChange: (value) {
                    createNewHoldingPageDoc["if_plot_number"] = value;
                  }),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'প্লট নাম্বার (যদি থাকে)',
                        hint: '',
                        onChange: (value) {
                          createNewHoldingPageDoc["plot_number"] = value;
                        }),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "ডাক ঘর",
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
                    child: CustomDropdown(
                        label: "থানা",
                        items: _items,
                        hint: "-----",
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
                        label: 'জেলা',
                        hint: 'রাজশাহী',
                        onChange: (value) {
                          createNewHoldingPageDoc["district_name"] = value;
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "বাড়ির অবস্থান (মানচিত্র)",
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
                  maxLines: 5, label: '', hint: '', onChange: () {}),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                "বাড়ি/হোল্ডিং এর বিবরণ",
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
                    child: CustomRadioGroup(
                      initialValue: "Pending",
                      items: const [
                        "পাকা / ফ্লাট",
                        "আধাপাকা",
                        "নির্মাণাধীন",
                        "কাঁচা / ফাঁকা"
                      ],
                      label: "ফ্লাট / পাকা / আধাপাকা / কাঁচা / ফাঁকা",
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
                      initialValue: "Pending",
                      items: const ["টাইলস", "মোজাইক", "সাধারণ"],
                      label: "টাইলস / মোজাইক / সাধারণ",
                      onChange: (index, value) {
                        debugPrint("index $index, Value $value");
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 8.0,
              ),
              CustomDropdown(
                  label: "বাড়ির হোল্ডিং কত তলা বিশিষ্ট",
                  items: _items,
                  hint: "",
                  require: true,
                  onChange: (String? value) {
                    debugPrint("$value");
                  }),
              const Text('একাধিক তালা না হলে ১ লিখুন'),
              const SizedBox(
                width: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "প্রতি তলার ক্ষেত্রফল (এরিয়া সহ বর্গফুট)",
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
                        label: "মোট ক্ষেত্রফল",
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
              const Text(
                "হোল্ডিংয়ের ব্যবহার",
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
                    child: CustomRadioGroup(
                      initialValue: "Pending",
                      items: const ["নিজবাস", "ভাড়া"],
                      label: "নিজবাস / ভাড়া",
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
                    child: CustomDropdown(
                        label: "কোন তলায় বসবাস",
                        items: _items,
                        hint: "",
                        require: true,
                        onChange: (String? value) {
                          debugPrint("$value");
                        }),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "নিজ (বর্গফুট)",
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
                        label: "ভাড়া (বর্গফুট)",
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
              const Text(
                "আবাসিক (আধাপাকা)",
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
                    child: CustomDropdown(
                        label: "নিজ (বর্গফুট)",
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
                        label: "ভাড়া (বর্গফুট)",
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
              const Text(
                "আবাসিক (কাঁচা/ফাঁকা)",
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
                    child: CustomDropdown(
                        label: "নিজ (বর্গফুট)",
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
                        label: "ভাড়া (বর্গফুট)",
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
              const Text(
                "বাণিজ্যিক (পাকা)",
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
                    child: CustomDropdown(
                        label: "নিজ (বর্গফুট)",
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
                        label: "ভাড়া (বর্গফুট)",
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
              const Text(
                "বাণিজ্যিক (কাঁচা/ফাঁকা)",
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
                    child: CustomDropdown(
                        label: "নিজ (বর্গফুট)",
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
                        label: "ভাড়া (বর্গফুট)",
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
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'ঋণের পরিমান',
                        hint: '',
                        onChange: (value) {
                          createNewHoldingPageDoc["loan_amount"] = value;
                        }),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'পরিশোধের মেয়াদ',
                        hint: '3',
                        onChange: (value) {
                          createNewHoldingPageDoc["payment_term"] = value;
                        }),
                  ),
                ],
              ),
              const SizedBox(
                width: 8.0,
              ),
              CustomTextField(
                  label: 'পরিশোধের মেয়াদ',
                  hint: '3',
                  onChange: (value) {
                    createNewHoldingPageDoc["payment_term"] = value;
                  }),
              const SizedBox(
                width: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomRadioGroup(
                      initialValue: "Pending",
                      items: const ["হ্যাঁ", "না"],
                      label: "বিদ্যুৎ / পানি / গ্যাস / টেলিফোন সংযোগ আছে কি না",
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
                      initialValue: "Pending",
                      items: const ["হ্যাঁ", "না"],
                      label: "ঋন আছে কি না",
                      onChange: (index, value) {
                        debugPrint("index $index, Value $value");
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 8.0,
              ),
              const Text(
                "জমি সংক্রন্ত",
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
              CustomFilePicker(
                label: "দলিলের কপি সংযুক্ত করতে হবে",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
              ),
              const Text('ইমেজ অথবা পিডিএফ'),
              const SizedBox(
                height: 8,
              ),
              CustomFilePicker(
                label:
                    "দলিল না থাকলে ডেভলপার ও জমির মালিকের চুক্তিপত্র সংযুক্ত করতে হবে",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
              ),
              const Text('ইমেজ অথবা পিডিএফ'),
              const SizedBox(
                height: 8,
              ),
              CustomFilePicker(
                label: "খতিয়ানের কপি যুক্ত করতে হবে",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
              ),
              const Text('ইমেজ অথবা পিডিএফ'),
              CustomFilePicker(
                label: "ডি. সি. আর. এর কপি সংযুক্ত করতে হবে",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
              ),
              const Text('ইমেজ অথবা পিডিএফ'),
              const SizedBox(
                height: 8,
              ),
              CustomFilePicker(
                label: "হালসহ খাজনার রশিদ এর কপি সংযুক্ত করতে হবে",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
              ),
              const Text('ইমেজ অথবা পিডিএফ'),
              const SizedBox(
                height: 8,
              ),
              CustomFilePicker(
                label: "আর. ডি. এ. প্লানের কপি সংযুক্ত করতে হবে",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
              ),
              const Text('ইমেজ অথবা পিডিএফ'),
              const SizedBox(
                height: 8,
              ),
              CustomFilePicker(
                label: "ইমারত অথবা জায়গার ছবি সংযুক্ত করতে হবে (ইমেজ ফাইল)",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
              ),
              const SizedBox(
                height: 8,
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
              CustomButton(
                  onClick: () {
                    print(createNewHoldingPageDoc.toString());
                  },
                  title: 'সাবমিট')
            ],
          ),
        ),
      ),
    );
  }
}
