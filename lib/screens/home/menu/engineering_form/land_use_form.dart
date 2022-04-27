import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/home/menu/engineering_form/controller/engineering_controller.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_date_picker.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

class LandUseFormPage extends StatefulWidget {
  const LandUseFormPage({Key? key}) : super(key: key);

  @override
  State<LandUseFormPage> createState() => _LandUseFormPageState();
}

class _LandUseFormPageState extends State<LandUseFormPage> {

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
                "ভূমি ব্যবহার অনাপত্তি ছাড়পত্রের জন্য আবেদন",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                color: Colors.black12,
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text("রেজিস্ট্রেশান কারির নাম"),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'বর্তমান ঠিকানা ', hint: '', onChange: (value) {}),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'স্থায়ী ঠিকানা', hint: '', onChange: (value) {}),
              const SizedBox(
                height: 16,
              ),
              const GradientText(
                "যে জমির জন্য অনাপত্তি ছাড়পত্র পেতে ইচ্ছুক তার তফসিল",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                color: Colors.black12,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'রাস্তার নাম/নং',
                        hint: '',
                        onChange: (value) {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'মৌজার নাম', hint: '', onChange: (value) {}),
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
                        label: "এলাকা/মহল্লার নাম",
                        items: _items,
                        hint: "",
                        require: true,
                        onChange: (value) {}),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "থানা",
                        items: _items,
                        hint: "------",
                        require: true,
                        onChange: (value) {}),
                  ),
                ],
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
                        label: 'জেলার নাম',
                        initialValue: 'রাজশাহী',
                        onChange: (value) {}, hint: '',),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'জমির পরিমাণ', hint: '', onChange: (value) {}),
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
                        label: "প্রস্তাবিত ভবনের তালার সংখ্যা",
                        items: _items,
                        hint: "",
                        require: true,
                        onChange: (value) {}),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "জে, এল, নং",
                        items: _items,
                        hint: "",
                        require: true,
                        onChange: (value) {}),
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
                        label: "আর এস দাগ নং/প্লট নং",
                        items: _items,
                        hint: "",
                        require: true,
                        onChange: (value) {}),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "আর এস দাগ নং/প্লট নং",
                        items: _items,
                        hint: "",
                        require: true,
                        onChange: (value) {}),
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
                        label: "ড্রাফট নং/পে অর্ডার নং",
                        items: _items,
                        hint: "",
                        require: true,
                        onChange: (value) {}),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDatePicker(
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
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                      label: 'ব্যাংকের নাম/শাখা',
                      hint: '',
                      onChange: (value) {},
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                      label: "টাকার পরিমাণ",
                      items: _items,
                      hint: "",
                      require: true,
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
