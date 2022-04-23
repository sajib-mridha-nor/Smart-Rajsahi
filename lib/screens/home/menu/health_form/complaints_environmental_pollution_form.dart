import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/home/menu/health_form/controller/health_controller.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'dart:io';

class ComplaintsEnvironmentalPollutionForm extends StatefulWidget {
  const ComplaintsEnvironmentalPollutionForm({Key? key}) : super(key: key);

  @override
  State<ComplaintsEnvironmentalPollutionForm> createState() =>
      _ComplaintsEnvironmentalPollutionFormState();
}

class _ComplaintsEnvironmentalPollutionFormState
    extends State<ComplaintsEnvironmentalPollutionForm> {
  final controller = Get.put(HealthController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          title: const Text("পরিবেশ দূষণ অভিযোগ"),
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
                    const Center(
                        child: Text(
                            '২০০৯ সালের ৯২ নং আইনের ধারা নং ১০,১৪ ও ২৬ বলে')),
                    const Divider(
                      color: Colors.black26,
                    ),
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
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: CustomTextField(
                              label: 'অভিযোগকারীর নাম',
                              hint: 'লিখুন',
                              maxLines: 1,
                              initialValue: '${controller.profile?.name}',
                              onChange: (value) {
                                controller.createEnvironmentComplaint[
                                    "name_complainer"] = value;
                              }),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 5,
                          child: CustomTextField(
                              label: 'অভিযোগকারীর মোবাইল',
                              hint: 'লিখুন',
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              onChange: (value) {
                                controller.createEnvironmentComplaint[
                                    "complainer_phone"] = value;
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomFilePicker(
                      label: "অভিযোগ বিষয়ক ছবি",
                      hint: "Choose File",
                      maxFileSize: 1.5,
                      allowedExtensions: const ["png", "jpg", "jpeg"],
                      onChange: (File file) {
                        controller.complaintPic(file);
                      },
                      require: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                        maxLines: 5,
                        label: 'অভিযোগ বিস্তারিত',
                        hint: 'লিখুন',
                        onChange: (value) {
                          controller.createEnvironmentComplaint[
                              "complain_details"] = value;
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                        label: 'অভিযুক্ত ব্যাক্তি/প্রতিষ্ঠানের নাম',
                        hint: 'লিখুন',
                        maxLines: 1,
                        onChange: (value) {
                          controller.createEnvironmentComplaint[
                              "complained_org_name"] = value;
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                        label: 'অভিযুক্ত ব্যাক্তি/প্রতিষ্ঠানের হোল্ডিং',
                        hint: 'লিখুন',
                        maxLines: 1,
                        onChange: (value) {
                          controller.createEnvironmentComplaint[
                              "complained_org_holding"] = value;
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                        label: "অভিযুক্ত ব্যাক্তি/প্রতিষ্ঠানের মোবাইল",
                        hint: 'লিখুন',
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        onChange: (value) {
                          controller.createEnvironmentComplaint[
                              "complained_org_phone"] = value;
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomDropdown(
                        label: 'অভিযুক্ত ব্যাক্তি/প্রতিষ্ঠানের মহল্লা',
                        hint: 'নির্বাচন করুন',
                        items: controller.mohollas.value
                            .map((e) => e!.name.toString())
                            .toList(),
                        onChange: (value) {
                          controller.createEnvironmentComplaint[
                              "complained_org_moholla"] = value;
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                      onClick: () {
                        if(_formKey.currentState!.validate()){
                          controller.submitEnvironmentComplain();
                        }
                      },
                      title: 'সাবমিট',
                      loading: controller.environmentComplainLoading.value,
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
