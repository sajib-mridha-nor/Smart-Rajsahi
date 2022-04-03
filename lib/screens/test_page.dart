import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rcc/screens/auth/login/login_page.dart';
import 'package:rcc/screens/auth/send_otp_page.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_date_picker.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_radio_group.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  var loading = false;
  final _formKey = GlobalKey<FormState>();
  final _items = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello World"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomDropdown(
                    label: "নির্বাচন করুন",
                    items: _items,
                    hint: "নির্বাচন করুন",
                    require: true,
                    onChange: (String? value) {
                      debugPrint("$value");
                    }),
                const SizedBox(
                  height: 16,
                ),
                CustomFilePicker(
                  label: "আপনার এনআইডি (NID) সন্মুখভাগ",
                  hint: "ছবি আপলোড করুন",
                  onChange: (File file) {
                    debugPrint("${file.path}");
                  },
                  require: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    label: "আপনার ফোন নম্বর দিন",
                    hint: "আপনার ফোন নম্বর দিন",
                    require: true,
                    onChange: (String value) {
                      debugPrint("$value");
                    }),
                const SizedBox(
                  height: 16,
                ),
                CustomRadioGroup(
                  initialValue: "Pending",
                  items: const ["Pending", "Released", "Blocked"],
                  label: "রেজিস্ট্রেশান কারির নাম",
                  onChange: (index, value) {
                    debugPrint("index $index, Value $value");
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomDatePicker(
                  label: "তারিখ নির্বাচন করুন",
                  hint: "তারিখ নির্বাচন করুন",
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 16,
                ),
                const GradientText(
                  "প্রশাসনিক বিভাগ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    onClick: () {
                      _formKey.currentState!.validate();
                    },
                    title: 'আপডেট করুন',
                    loading: loading,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(SendOtpPage());
                    },
                    child: Text('Next Page')),
                ElevatedButton(
                    onPressed: () {
                      Get.to(LoginPage());
                    },
                    child: Text('Login Page'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
