import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/home/menu/health_form/premises_registration/controller/premises_controller.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';
import 'dart:io';

class PremisesSecondPageForm extends StatefulWidget {
  const PremisesSecondPageForm({Key? key}) : super(key: key);

  @override
  State<PremisesSecondPageForm> createState() =>
      _PremisesSecondPageFormState();
}

class _PremisesSecondPageFormState extends State<PremisesSecondPageForm> {
  @override
  Widget build(BuildContext context) {
    final _items = [
      "1",
      "2",
      "3",
      "4",
      "5",
    ];
    final _controller = Get.put(PremisesController());

    var createPremisesRegistrationFirstPageDoc = <String, dynamic>{};
    return Scaffold(
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
                "মালিকের ঠিকানা (স্থায়ী)",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                color: Colors.black26,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        label: 'হোল্ডিং নং',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("owner_holding_no", value);
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CustomTextField(
                        label: 'রাস্তার নাম',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("owner_road_name", value);
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
                    child: CustomDropdown(
                        label: "ওয়ার্ড নং",
                        items: _controller.wards.map((e) => e!.wardNoBangla.toString()).toList(),
                        hint: "নির্বাচন করুন",
                        require: true,
                        initialValue: _controller.wards
                            .firstWhereOrNull((element) =>
                        element?.wardNo ==
                            _controller
                                .premisesRegistrationDoc["owner_ward_no"])
                            ?.wardNoBangla,
                        onChange: (String? value) {
                          final item = _controller.wards.firstWhere((element) =>
                          element?.wardNoBangla.toString().trim() ==
                              value.toString().trim());
                          _controller.addValueToDoc("owner_ward_no", item?.wardNo);
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CustomTextField(
                        label: 'মহল্লার নাম',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("owner_area_name", value);
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
                    child: CustomTextField(
                        label: 'ব্লক',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("owner_block", value);
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CustomTextField(
                        label: 'থানা',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("owner_thana", value);
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
                    child: CustomTextField(
                        label: 'পোস্ট অফিস',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("owner_post_office", value);
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CustomTextField(
                        label: "পোস্ট কোড",
                        hint: "",
                        require: true,
                        keyboardType: TextInputType.number,
                        onChange: (String? value) {
                          _controller.addValueToDoc("owner_post_code", value);
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
                    child: CustomTextField(
                        label: 'জেলা',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("permanent_zilla", value);
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CustomTextField(
                        label: 'ফোন/মোবাইল',
                        hint: '',
                        minLength: 11,
                        keyboardType: TextInputType.number,
                        onChange: (value) {
                          _controller.addValueToDoc("owner_phone_no", value);
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const GradientText(
                "মালিকের ঠিকানা (বর্তমান)",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                color: Colors.black26,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        label: 'হোল্ডিং নং',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("owner_holding_no_pr", value);
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CustomTextField(
                        label: 'রাস্তার নাম',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("owner_road_name_pr", value);
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
                        label: "ওয়ার্ড নং",
                        items: _controller.wards.map((e) => e!.wardNoBangla.toString()).toList(),
                        hint: "নির্বাচন করুন",
                        require: true,
                        initialValue: _controller.wards
                            .firstWhereOrNull((element) =>
                        element?.wardNo ==
                            _controller
                                .premisesRegistrationDoc["owner_ward_no_pr"])
                            ?.wardNoBangla,
                        onChange: (String? value) {
                          final item = _controller.wards.firstWhere((element) =>
                          element?.wardNoBangla.toString().trim() ==
                              value.toString().trim());
                          _controller.addValueToDoc("owner_ward_no_pr", item?.wardNo);
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'মহল্লার নাম',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("owner_area_name_pr", value);
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
                    child: CustomTextField(
                        label: 'ব্লক',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("owner_block_pr", value);
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CustomTextField(
                        label: 'থানা',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("owner_thana_pr", value);
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
                    child: CustomTextField(
                        label: 'পোস্ট অফিস',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("owner_post_office_pr", value);
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CustomTextField(
                        label: "পোস্ট কোড",
                        hint: "",
                        require: true,
                        keyboardType: TextInputType.number,
                        onChange: (String? value) {
                          _controller.addValueToDoc("owner_post_code_pr", value);
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
                    child: CustomTextField(
                        label: 'জেলা',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("present_zilla", value);
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CustomTextField(
                        label: 'ফোন/মোবাইল',
                        hint: '',
                        minLength: 11,
                        keyboardType: TextInputType.number,
                        onChange: (value) {
                          _controller.addValueToDoc("owner_phone_no_pr", value);
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              const GradientText(
                "ব্যবসা প্রতিষ্ঠানের ঠিকানা",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                color: Colors.black26,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        label: 'হোল্ডিং নং',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("organization_holding_no", value);
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CustomTextField(
                        label: 'রাস্তার নাম',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("organization_road_name", value);
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
                        label: "ওয়ার্ড নং",
                        items: _controller.wards.map((e) => e!.wardNoBangla.toString()).toList(),
                        hint: "নির্বাচন করুন",
                        require: true,
                        initialValue: _controller.wards
                            .firstWhereOrNull((element) =>
                        element?.wardNo ==
                            _controller
                                .premisesRegistrationDoc["organization_ward_no"])
                            ?.wardNoBangla,
                        onChange: (String? value) {
                          final item = _controller.wards.firstWhere((element) =>
                          element?.wardNoBangla.toString().trim() ==
                              value.toString().trim());
                          _controller.addValueToDoc("organization_ward_no", item?.wardNo);
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'মহল্লার নাম',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("organization_area_name", value);
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
                        label: 'ব্লক',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("organization_block", value);
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'থানা',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("organization_thana", value);
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
                        label: 'পোস্ট অফিস',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("organization_post_office", value);
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: "পোস্ট কোড",
                        hint: "",
                        require: true,
                        keyboardType: TextInputType.number,
                        onChange: (String? value) {
                          _controller.addValueToDoc("organization_post_code", value);
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
                        label: 'জেলা',
                        hint: '',
                        onChange: (value) {
                          _controller.addValueToDoc("zilla", value);
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'ফোন/মোবাইল',
                        hint: '',
                        minLength: 11,
                        keyboardType: TextInputType.number,
                        onChange: (value) {
                          _controller.addValueToDoc("organization_phone_no", value);
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
