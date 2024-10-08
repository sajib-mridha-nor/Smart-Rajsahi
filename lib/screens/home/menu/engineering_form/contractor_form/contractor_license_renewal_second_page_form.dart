import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/home/menu/health_form/controller/health_controller.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_date_picker.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_radio_group.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

class ContractorSecondPage extends StatefulWidget {
  const ContractorSecondPage({Key? key}) : super(key: key);

  @override
  State<ContractorSecondPage> createState() => _ContractorSecondPageState();
}

class _ContractorSecondPageState extends State<ContractorSecondPage> {
  final _items = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(HealthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          title: const Text("ঠিকাদার লাইসেন্স তালিকাভুক্তি/নবায়ন"),
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

                const Text('Information of the Applicant',

                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black12,
                ),

                CustomTextField(
                    label: 'Organization',
                    hint: '',
                    maxLines: 1,
                    onChange: (value) {
                      controller
                          .createAnimalLicenceDoc["organization"] =
                          value;
                    }),
                const SizedBox(
                  height: 8.0,
                ),
                CustomTextField(
                    label: 'Business/Mailing Address',
                    hint: '',
                    maxLines: 1,
                    maxLength: 2,
                    keyboardType: TextInputType.emailAddress,
                    onChange: (value) {
                      controller
                          .createAnimalLicenceDoc["buss_address"] =
                          value;
                    }),
                const SizedBox(
                  height: 8.0,
                ),
                CustomDropdown(
                    label: "Constitution of Applicant",
                    items: _items,
                    hint: "------",
                    require: true,
                    onChange: (String? value) {
                      debugPrint("$value");
                    }),
                const SizedBox(
                  height: 8,
                ),
                CustomDropdown(
                    label: "Type of Contractor",
                    items: _items,
                    hint: "1",
                    require: true,
                    onChange: (String? value) {
                      debugPrint("$value");
                    }),

                const SizedBox(
                  height: 8,
                ),

                CustomTextField(
                    label: 'VAT Registration Number',
                    hint: '',
                    onChange: (value) {}
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                    label: 'TIN',
                    hint: '',
                    onChange: (value) {

                    }),
                const SizedBox(
                  height: 8,
                ),
                CustomDatePicker(
                  label: "তারিখ নির্বাচন করুন",
                  hint: "তারিখ নির্বাচন করুন",
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomDropdown(
                    label: "Ward Number",
                    items: _items,
                    hint: "------",
                    require: true,
                    onChange: (String? value) {
                      debugPrint("$value");
                    }),

                const SizedBox(
                  height: 8,
                ),
                CustomRadioGroup(
                initialValue: '',
                  items: const ["Yes", "No"],
                  label: "License renew?",
                  onChange: (index, value) {
                    debugPrint("index $index, Value $value");
                  },
                ),
                SizedBox(
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
