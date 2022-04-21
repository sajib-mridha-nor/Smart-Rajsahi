import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/home/menu/health_form/controller/health_controller.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_radio_group.dart';
import 'package:rcc/widgets/custom_text_field.dart';

class AnimalLicencePageForm extends StatefulWidget {
  const AnimalLicencePageForm({Key? key}) : super(key: key);

  @override
  State<AnimalLicencePageForm> createState() => _AnimalLicencePageFormState();
}

class _AnimalLicencePageFormState extends State<AnimalLicencePageForm> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(HealthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          title: const Text("পোষা প্রাণীর লাইসেন্স"),
          gradient:
              LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")])),
      body: SingleChildScrollView(
        child: Obx(() => Container(
              margin: const EdgeInsets.all(16),
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
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: CustomTextField(
                              label: 'প্রাণীর ধরন',
                              hint: '',
                              maxLines: 1,
                              textInputAction: TextInputAction.next,
                              onChange: (value) {
                                controller
                                        .createAnimalLicenceDoc["animal_type"] =
                                    value;
                              }),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 5,
                          child: CustomTextField(
                              label: 'প্রাণীর বয়স',
                              hint: '',
                              maxLines: 1,
                              maxLength: 2,
                              keyboardType: TextInputType.number,
                              onChange: (value) {
                                controller
                                        .createAnimalLicenceDoc["animal_age"] =
                                    value;
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomFilePicker(
                      label: "প্রাণীর ছবি",
                      hint: "Choose File",
                      maxFileSize: 1.5,
                      allowedExtensions: const ["png", "jpg", "jpeg"],
                      onChange: (File file) {
                        controller.animalPic(file);
                      },
                      require: true,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomFilePicker(
                      label: "র‍্যাবিস টিকাদানের প্রত্যয়নের কপি",
                      hint: "Choose File",
                      maxFileSize: 1.5,
                      allowedExtensions: const ["png", "jpg", "jpeg"],
                      onChange: (File file) {
                        controller.vaccinePic(file);
                      },
                      require: true,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: CustomRadioGroup(
                            initialValue: "পুরুষ",
                            items: const [
                              "পুরুষ",
                              "মহিলা",
                            ],
                            label: "প্রাণীর লিঙ্গ",
                            onChange: (index, value) {
                              controller
                                      .createAnimalLicenceDoc["animal_gender"] =
                                  value;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 5,
                          child: CustomRadioGroup(
                            initialValue: "নতুন",
                            items: const [
                              "নতুন",
                              "নবায়ন",
                            ],
                            label: "লাইসেন্সের ধরন",
                            onChange: (index, value) {
                              controller
                                      .createAnimalLicenceDoc["licence_type"] =
                                  value;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
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
                        if (_formKey.currentState!.validate()) {
                          controller.submitPetLicence();
                        }
                      },
                      title: 'সাবমিট',
                      loading: controller.petLicenceLoading.value,
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
