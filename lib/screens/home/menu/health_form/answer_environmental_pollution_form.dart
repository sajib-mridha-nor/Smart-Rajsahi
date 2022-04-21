import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/home/menu/health_form/controller/health_controller.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';
import 'dart:io';

class AnswerEnvironmentalPollutionForm extends StatefulWidget {
  const AnswerEnvironmentalPollutionForm({Key? key}) : super(key: key);

  @override
  State<AnswerEnvironmentalPollutionForm> createState() =>
      _AnswerEnvironmentalPollutionFormState();
}

class _AnswerEnvironmentalPollutionFormState
    extends State<AnswerEnvironmentalPollutionForm> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(HealthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          title: const Text("পরিবেশ দূষণ অভিযোগ এর উত্তর"),
          gradient:
              LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")])),
      body: SingleChildScrollView(
        child: Obx(() => Container(
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
                      '${controller.profile?.name}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          letterSpacing: 1.2),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: CustomTextField(
                              label: 'অভিযুক্তের নাম',
                              hint: 'লিখুন',
                              maxLines: 1,
                              textInputAction: TextInputAction.next,
                              onChange: (value) {
                                controller.createEnvironmentAnsDoc[
                                    "name_complained"] = value;
                              }),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 5,
                          child: CustomTextField(
                              label: "অভিযুক্তের বাবার নাম",
                              hint: 'লিখুন',
                              maxLines: 1,
                              onChange: (value) {
                                controller.createEnvironmentAnsDoc[
                                    "father_complained"] = value;
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
                              label: 'সুস্পষ্ট আইডি থাকলে',
                              hint: 'লিখুন',
                              maxLines: 1,
                              require: false,
                              onChange: (value) {
                                controller.createEnvironmentAnsDoc["valid_id"] =
                                    value;
                              }),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 5,
                          child: CustomTextField(
                              label: 'অভিযুক্তের মোবাইল নং',
                              hint: 'লিখুন',
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              onChange: (value) {
                                controller.createEnvironmentAnsDoc[
                                    "complained_phone"] = value;
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomTextField(
                        maxLines: 8,
                        label: 'অভিযোগ বিস্তারিত',
                        hint: 'লিখুন',
                        onChange: (value) {
                          controller
                                  .createEnvironmentAnsDoc["complain_details"] =
                              value;
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomFilePicker(
                      label: "অভিযোগ বিষয়ক ছবি",
                      hint: "Choose File",
                      maxFileSize: 1.5,
                      allowedExtensions: const ["png", "jpg", "jpeg"],
                      onChange: (File file) {
                        controller.allegationPic(file);
                      },
                      require: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                      onClick: () {
                        if (_formKey.currentState!.validate()) {
                          controller.submitEnvironmentAns();
                        }
                      },
                      title: 'সাবমিট',
                      loading: controller.environmentAnsLoading.value,
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
