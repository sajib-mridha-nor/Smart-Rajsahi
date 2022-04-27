import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/home/menu/engineering_form/vehicle_agency/vehicle_agency_controller.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_date_picker.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

class VehicleAgencyFormPage extends StatefulWidget {
  const VehicleAgencyFormPage({Key? key}) : super(key: key);

  @override
  State<VehicleAgencyFormPage> createState() => _VehicleAgencyFormPageState();
}

class _VehicleAgencyFormPageState extends State<VehicleAgencyFormPage> {
  final _controller = Get.put(VehicleAgencyController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          title: const Text('যানবাহন / যন্ত্রপাতি ভাড়া'),
          gradient:
              LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")])),
      body: _controller.obx((state) {
        return SingleChildScrollView(
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
                  GestureDetector(
                    onTap: () {},
                    child: const GradientText(
                      "যানবাহন ও যন্ত্রপাতির ভাড়া সংক্রান্ত আবেদন",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Text("রেজিস্ট্রেশান কারির নাম"),
                  Text(
                    '${_controller.profile.value?.name}',
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
                            label: 'ঠিকাদারী প্রতিষ্ঠান/ব্যক্তির নাম',
                            hint: '',
                            onChange: (value) {
                              _controller.vehicleAgencyMap["contructor_name"] =
                                  value;
                            }),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        flex: 5,
                        child: CustomTextField(
                            label: 'কাজের বিবরন',
                            hint: '',
                            onChange: (value) {
                              _controller.vehicleAgencyMap["work_name"] = value;
                            }),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: CustomTextField(
                            label: 'কাজের স্থান',
                            hint: '',
                            onChange: (value) {
                              _controller.vehicleAgencyMap["work_place"] = value;
                            }),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        flex: 5,
                        child: CustomDatePicker(
                            label: 'কার্যাদেশের তারিখ',
                            hint: '',
                            dateMask: "dd-MM-yyyy",
                            onChange: (value) {
                              var parts = value!.split('-');
                              //01-01-1991 Dummy
                              final date = parts[2].trim() +
                                  "-" +
                                  parts[1].trim() +
                                  "-" +
                                  parts[0].trim();
                              _controller.vehicleAgencyMap["date_of_action"] =
                                  date;
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomTextField(
                      label: 'কার্যাদেশ ইস্যুকারী প্রতিষ্ঠানের নাম',
                      hint: '',
                      onChange: (value) {
                        _controller.vehicleAgencyMap["mandate_organisation"] =
                            value;
                      }),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomDatePicker(
                      label: 'কাজের তারিখ',
                      hint: '',
                      dateMask: "dd-MM-yyyy",
                      onChange: (value) {
                        var parts = value!.split('-');
                        //01-01-1991 Dummy
                        final date = parts[2].trim() +
                            "-" +
                            parts[1].trim() +
                            "-" +
                            parts[0].trim();
                        _controller.vehicleAgencyMap["work_date"] = date;
                      }),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomDropdown(
                      label: "আবেদনকৃত যানবাহন/যন্ত্রপাতির নাম/ধরন",
                      items: state!.map((e) => e.name.toString()).toList(),
                      hint: "--------",
                      require: true,
                      onChange: (String? value) {
                        var item = state.firstWhere((element) =>
                        element.name.toString() == value.toString());
                        _controller.vehicleAgencyMap["vehicle_description"] =
                            item.id;
                      }),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomTextField(
                      label: "যানবাহন/যন্ত্রপাতির সংখ্যা",
                      hint: "",
                      keyboardType: TextInputType.number,
                      require: true,
                      onChange: (String? value) {
                        _controller.vehicleAgencyMap["vehicle_quantity"] = value;
                      }),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomTextField(
                      label: "যানবাহন/যন্ত্রপাতি ব্যবহারের দিন সংখ্যা",
                      hint: "",
                      keyboardType: TextInputType.number,
                      require: true,
                      onChange: (String? value) {
                        _controller.vehicleAgencyMap["vehicle_quantity"] = value;
                      }),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomTextField(
                      maxLines: 6,
                      label:
                      'আবেদনকারীর যানবাহন/যন্ত্রপাতি যে ধরনের কাজে ব্যবহার করা হইবে উহার সংক্ষিপ্ত বিবরণ',
                      hint: '',
                      onChange: (value) {
                        _controller
                            .vehicleAgencyMap["purpose_of_applied_vehicle"] =
                            value;
                      }),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomFilePicker(
                    label: 'গ্রহণকারীর স্বাক্ষর',
                    hint: 'Choose File',
                    maxFileSize: 1.5,
                    allowedExtensions: const ["png", "jpg", "jpeg"],
                    onChange: (File file) {
                      _controller.signatureFile(file);
                    },
                    // require: true,
                  ),
                  const Text('স্ক্যান কপি আপলোড করুন'),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomFilePicker(
                    label: 'অন্য সংস্থার কার্যাদেশ ও শিডিউলের কপি সংযুক্ত করুন',
                    hint: 'Choose File',
                    maxFileSize: 1.5,
                    allowedExtensions: const ["png", "jpg", "jpeg"],
                    onChange: (File file) {
                      _controller.additionalFile(file);
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
                    'বর্ণিত তথ্যাদি সঠিক। কোন রকম সত্য গোপন করা হয় নাই বা কোন মিথ্যা তথ্য প্রদান করা হয় নাই। পরবর্তীতে কোন বিষয় বা তথ্য স্বপক্ষে মিথ্যা প্রমাণিত হইলে আমার বিরুদ্ধে প্রচলিত আইনে ব্যবস্থা গ্রহণ করা যাইবে।',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Obx(() => CustomButton(
                    onClick: () {
                      if (_formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        TextEditingController().clear();
                        _controller.submit();
                      }
                    },
                    title: 'সাবমিট',
                    loading: _controller.submitLoading.value,
                  ))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
