import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_date_picker.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

import 'controller/academic_controller.dart';

class CorporationPlaceRentForm extends StatefulWidget {
  const CorporationPlaceRentForm({Key? key}) : super(key: key);

  @override
  State<CorporationPlaceRentForm> createState() =>
      _CorporationPlaceRentFormState();
}

class _CorporationPlaceRentFormState extends State<CorporationPlaceRentForm> {
  final _controller = Get.put(AcademicController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          title: const Text("সিটি কর্পোরেশনের জায়গা ভাড়া"),
          gradient:
              LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")])),
      body: Obx(() => SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text("রেজিস্ট্রেশান কারির নাম"),
                    Text(
                      '${_controller.profile?.name}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          letterSpacing: 1.2),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                        label: 'জায়গার নাম ',
                        hint: 'জায়গার নাম লিখুন',
                        onChange: (value) {
                          _controller.addCcSpaceRentDoc("space_name", value);
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomDatePicker(
                        label: 'তারিখ',
                        hint: 'সিলেক্ট করুন',
                        dateMask: "dd-MM-yyyy",
                        onChange: (value) {
                          var parts = value!.split('-');
                          //01-01-1991 Dummy
                          final date = parts[2].trim() +
                              "-" +
                              parts[1].trim() +
                              "-" +
                              parts[0].trim();

                          _controller.addCcSpaceRentDoc("date", date);
                        }),
                    const SizedBox(
                      height: 8.0,
                    ),
                    CustomTextField(
                        maxLines: 6,
                        label: 'জায়গা ভাড়ার  কারণ বিস্তারিত লিখুন  ',
                        hint: 'এখানে লিখুন',
                        onChange: (value) {
                          _controller.addCcSpaceRentDoc("reason", value);
                        }),
                    const SizedBox(
                      height: 32.0,
                    ),
                    CustomFilePicker(
                      label: 'সংযুক্ত কাগজ',
                      hint: 'Choose File',
                      onChange: (value) {
                        _controller.addCcSpaceRentDoc("attachment", value.path);
                      },
                      allowedExtensions: const ["png", "jpg", "jpeg"],
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    CustomButton(
                      onClick: () {
                        if (_formKey.currentState!.validate()) {
                          _controller.ccSpaceRentFormSubmit();
                        }
                      },
                      title: 'সাবমিট',
                      loading: _controller.submitLoading.value,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
