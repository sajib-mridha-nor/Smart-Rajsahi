import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

class AcademicForm extends StatefulWidget {
  const AcademicForm({Key? key}) : super(key: key);

  @override
  State<AcademicForm> createState() => _AcademicFormState();
}

class _AcademicFormState extends State<AcademicForm> {
  final _items = [
    "00",
    "10",
    "20",
    "40",
    "50",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 3.0,
          elevation: 15.0,
          leading: const BackButton(),
          title: const Text('প্রশাসনিক বিভাগ'),
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
                  // Get.to(const EngineeringFormPage());
                },
                child: Container(
                  // margin: const EdgeInsets.all(10.0),
                  child: const GradientText(
                    "আর্থিক সহায়তা প্রদান",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                indent: 1.0,
                color: Colors.grey,
                endIndent: 12.0,
              ),
              CustomTextField(
                  label: 'রেজিস্ট্রেশান কারির নাম ',
                  hint: 'Jannatul Ferdous',
                  onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              CustomDropdown(
                  label: "টাকার পরিমাণ *",
                  items: _items,
                  hint: "00",
                  require: true,
                  onChange: (String? value) {
                    debugPrint("$value");
                  }),
              const SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                  maxLines: 10,
                  label:
                      'যে সম্পর্কে আর্থিক সহায়তা প্রয়োজন সে সম্পর্কে বিস্তারিত লিখুন   ',
                  hint: 'এখানে লিখুন',
                  onChange: () {}),
              const SizedBox(
                height: 32.0,
              ),
              CustomButton(onClick: () {}, title: 'সাবমিট করুন')
            ],
          ),
        ),
      ),
    );
  }
}
