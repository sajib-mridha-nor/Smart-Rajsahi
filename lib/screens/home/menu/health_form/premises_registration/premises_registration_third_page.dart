import 'package:flutter/material.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_date_picker.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_radio_group.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';
import 'dart:io';

class PremisesThirdPageForm extends StatefulWidget {
  const PremisesThirdPageForm({Key? key}) : super(key: key);

  @override
  State<PremisesThirdPageForm> createState() => _PremisesThirdPageFormState();
}

class _PremisesThirdPageFormState extends State<PremisesThirdPageForm> {
  @override
  Widget build(BuildContext context) {
    final _items = [
      "1",
      "2",
      "3",
      "4",
      "5",
    ];
    var createPremisesRegistrationFirstPageDoc = <String, dynamic>{};
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 16.0,
              ),
              GestureDetector(
                onTap: () {},

                // margin: const EdgeInsets.all(10.0),
                child: const GradientText(
                  "ব্যক্তি, ব্যবসা এবং প্রতিষ্ঠানের তথ্য",
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
              CustomDatePicker(
                label: "ব্যবসা আরম্ভ করার তারিখ",
                hint: "",
                onChange: (value) {
                  createPremisesRegistrationFirstPageDoc["date_picker"] = value;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'প্রিমিসেস নিবন্ধিকরন ব্যবহারের উদ্দেশ্য',
                  hint: '',
                  onChange: (value) {
                    createPremisesRegistrationFirstPageDoc["prmises_use"] =
                        value;
                  }),
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
                  onChange: (value) {
                    createPremisesRegistrationFirstPageDoc[
                        'drainage_waste_control'] = value;
                  }),
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
              CustomButton(
                  onClick: () {
                    print(createPremisesRegistrationFirstPageDoc.toString());
                  },
                  title: 'সাবমিট')
            ],
          ),
        ),
      ),
    );
  }
}
