import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rcc/screens/home/menu/health_form/premises_registration/controller/premises_controller.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';
import 'dart:io';

class PremisesRegistrationFirstPage extends StatefulWidget {
  const PremisesRegistrationFirstPage({Key? key}) : super(key: key);

  @override
  State<PremisesRegistrationFirstPage> createState() =>
      _PremisesRegistrationFirstPageState();
}

class _PremisesRegistrationFirstPageState
    extends State<PremisesRegistrationFirstPage> {
  final _controller = Get.put(PremisesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(() => Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Text(
                      '২০০৫ সনের ২৭ নং আইন দ্বারা সংশোধিত বাংলাদেশ বিশুদ্ধ খাদ্য অধ্যাদেশ ১৯৫৯ এর ২১(১) ও (২) ধারা অনুযায়ী'),
                  const Divider(
                    color: Colors.black12,
                  ),
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
                      label: 'ব্যবসা প্রতিষ্ঠান নাম ',
                      hint: 'ব্যবসা প্রতিষ্ঠান নাম লিখুন',
                      initialValue: _controller
                          .premisesRegistrationDoc["organization_name"],
                      onChange: (value) {
                        _controller
                                .premisesRegistrationDoc["organization_name"] =
                            value;
                      }),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDropdown(
                      label: "নিবন্ধনের ধরণ",
                      items: const ["নতুন", "নবায়ন", "বাতিল", "ডুব্লিকেট"],
                      hint: "নির্বাচন করুন",
                      require: true,
                      initialValue:
                          _controller.premisesRegistrationDoc["pr_type_of_reg"],
                      onChange: (String? value) {
                        _controller.premisesRegistrationDoc["pr_type_of_reg"] =
                            value;
                      }),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDropdown(
                      label: "ব্যবসার ধরন",
                      items: _controller.temperaments
                          .map((element) => element.temperament.toString())
                          .toList(),
                      hint: "নির্বাচন করুন",
                      require: true,
                      initialValue: _controller.temperaments
                          .firstWhereOrNull((element) =>
                              element.id ==
                              _controller.premisesRegistrationDoc[
                                  "business_temperament"])
                          ?.temperament,
                      onChange: (String? value) {
                        final item = _controller.temperaments.firstWhere(
                            (element) =>
                                element.temperament.toString().trim() ==
                                value.toString().trim());
                        _controller.premisesRegistrationDoc[
                            "business_temperament"] = item.id;
                        _controller.filterTemperamentType(item.id);
                      }),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomDropdown(
                      label: "ব্যবসার প্রকৃতি",
                      items: _controller.filterTemperamentTypes.value
                          .map((element) =>
                              element.type.toString())
                          .toList(),
                      hint: "নির্বাচন করুন",
                      require: true,
                      initialValue: _controller.filterTemperamentTypes.value
                          .firstWhereOrNull((element) =>
                              element.id ==
                              _controller
                                  .premisesRegistrationDoc["business_type"])
                          ?.type,
                      onChange: (String? value) {
                        final item = _controller.filterTemperamentTypes.value
                            .firstWhere((element) =>
                                element.type.toString().trim() == value);
                        _controller.premisesRegistrationDoc["business_type"] =
                            item.id;
                      }),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                      label: 'মালিকের নাম',
                      hint: 'মালিকের নাম',
                      initialValue:
                          _controller.premisesRegistrationDoc["owner_name"],
                      onChange: (value) {
                        _controller.premisesRegistrationDoc["owner_name"] =
                            value;
                      }),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomFilePicker(
                    label: "আবেদনকারীর ছবি",
                    hint: "Choose File",
                    maxFileSize: 1.5,
                    allowedExtensions: const ["png", "jpg", "jpeg"],
                    onChange: (File file) {
                      _controller.applicantPhoto(file);
                    },
                    require: true,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                      label: 'মালিকের পিতা/স্বামী/অভিবাবক এর নাম',
                      hint: '',
                      onChange: (value) {
                        _controller.premisesRegistrationDoc["owner_father_name"] =
                            value;
                      }),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                      label: 'মালিকের মাতার নাম',
                      hint: '',
                      onChange: (value) {
                        _controller.premisesRegistrationDoc["owner_mother_name"] =
                            value;
                      }),
                ],
              ),
            )
        ),
      ),
    );
  }
}
