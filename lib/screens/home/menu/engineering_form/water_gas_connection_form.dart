import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/home/menu/engineering_form/controller/engineering_controller.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'dart:io';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_text_field.dart';

class WaterGasConnectionForm extends StatefulWidget {
  const WaterGasConnectionForm({Key? key}) : super(key: key);

  @override
  State<WaterGasConnectionForm> createState() => _WaterGasConnectionFormState();
}

class _WaterGasConnectionFormState extends State<WaterGasConnectionForm> {
  final _controller = Get.put(EngineeringController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          title: const Text('প্রকৌশল বিভাগ'),
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
                    const Text(
                      "বর্তমান পানি সংযোগের ঠিকানা",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
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
                              label: 'হোল্ডিং নং',
                              hint: '',
                              onChange: (value) {
                                _controller.waterConnectionMap["holding_no"] =
                                    value;
                              }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 5,
                          child: CustomDropdown(
                              label: "ওয়ার্ড নং",
                              items: _controller.wards.value
                                  .map((e) => e!.wardNo.toString())
                                  .toList(),
                              hint: "নির্বাচন করুন",
                              require: true,
                              initialValue: _controller.wards.value
                                  .firstWhereOrNull((element) =>
                                      element?.wardNo ==
                                      _controller.waterConnectionMap[
                                          "organization_ward_no"])
                                  ?.wardNo
                                  .toString(),
                              onChange: (String? value) {
                                final item = _controller.wards.value.firstWhere(
                                    (element) =>
                                        element?.wardNo.toString().trim() ==
                                        value.toString().trim());
                                _controller.waterConnectionMap[
                                    "organization_ward_no"] = item?.wardNo;
                              }),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: CustomDropdown(
                              label: 'মহল্লার নাম',
                              items: _controller.mohollas.value
                                  .map((e) => e!.name.toString())
                                  .toList(),
                              hint: "নির্বাচন করুন",
                              require: true,
                              initialValue: _controller.mohollas.value
                                  .firstWhereOrNull((element) =>
                                      element?.id ==
                                      _controller
                                          .waterConnectionMap["area_name"])
                                  ?.name,
                              onChange: (String? value) {
                                final item = _controller.mohollas.value
                                    .firstWhere((element) =>
                                        element?.name.toString().trim() ==
                                        value.toString().trim());
                                _controller.waterConnectionMap["area_name"] =
                                    item?.id;
                              }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 5,
                          child: CustomDropdown(
                              label: 'থানা',
                              items: _controller.thanas.value
                                  .map((e) => e!.name.toString())
                                  .toList(),
                              hint: "নির্বাচন করুন",
                              require: true,
                              initialValue: _controller.thanas.value
                                  .firstWhereOrNull((element) =>
                                      element?.id ==
                                      _controller.waterConnectionMap["thana"])
                                  ?.name,
                              onChange: (String? value) {
                                final item = _controller.thanas.value
                                    .firstWhere((element) =>
                                        element?.name.toString().trim() ==
                                        value.toString().trim());
                                _controller.waterConnectionMap["thana"] =
                                    item?.id;
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    CustomTextField(
                        maxLines: 6,
                        label: 'সাইটের নিকটস্থ রাস্তার বিবরণ  ',
                        hint: 'এখানে লিখুন',
                        onChange: (value) {
                          _controller.waterConnectionMap["road_details"] =
                              value;
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: CustomTextField(
                              label: 'রাস্তার নাম',
                              hint: '',
                              onChange: (value) {
                                _controller.waterConnectionMap["road_name"] =
                                    value;
                              }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 5,
                          child: CustomTextField(
                              label: 'অবস্থান',
                              hint: '',
                              onChange: (value) {
                                _controller.waterConnectionMap["location"] =
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
                              label: 'মূল সড়ক হইতে দুরুত্ব',
                              hint: '',
                              onChange: (value) {
                                _controller.waterConnectionMap[
                                    "distance_main_road"] = value;
                              }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 5,
                          child: CustomTextField(
                              label: 'বিস্তার/প্রশস্ত',
                              hint: '',
                              onChange: (value) {
                                _controller.waterConnectionMap["wide"] = value;
                              }),
                        ),
                      ],
                    ),
                    const Text('১০০ মিটার অথবা ১ কিলোমিটার'),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'সংযুক্ত :',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      color: Colors.black12,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomFilePicker(
                      label: 'এনআইডি কপি সংযুক্ত করুন',
                      hint: 'Choose File',
                      maxFileSize: 1.5,
                      allowedExtensions: const ["png", "jpg", "jpeg"],
                      onChange: (File file) {
                        _controller.nidFile(file);
                      },
                      // require: true,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomFilePicker(
                      label: 'রাজশাহী ওয়াসা কর্তৃক প্রদেয় ডিমান্ড নোট',
                      hint: 'Choose File',
                      maxFileSize: 1.5,
                      allowedExtensions: const ["png", "jpg", "jpeg"],
                      onChange: (File file) {
                        _controller.demandNoteFile(file);
                      },
                      // require: true,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomFilePicker(
                      label:
                          'রাজশাহী সিটি কর্পোরেশন কর্তৃক প্রদেয় হাল নাগাদ হোল্ডিং কর পরিশোধের রশিদ',
                      hint: 'Choose File',
                      maxFileSize: 1.5,
                      allowedExtensions: const ["png", "jpg", "jpeg"],
                      onChange: (File file) {
                        _controller.taxFile(file);
                      },
                      // require: true,
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
                    CustomButton(onClick: () {
                      if (_formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        TextEditingController().clear();
                        _controller.waterGasConnectionFormSubmit();
                      }
                    }, title: 'সাবমিট', loading: _controller.submitLoading.value,)
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
