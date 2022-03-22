import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rcc/screens/auth/verify_otp_page.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

class SendOtpPage extends StatefulWidget {
  const SendOtpPage({Key? key}) : super(key: key);

  @override
  State<SendOtpPage> createState() => _SendOtpPageState();
}

class _SendOtpPageState extends State<SendOtpPage> {
  var loading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 65,
              ),
              Center(
                child: Image.network(
                  'https://smartrajshahi.gov.bd/static/mainsite/img/logo/logo.png',
                  width: 85,
                  height: 85,
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'স্মার্ট রাজশাহী',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              const SizedBox(
                height: 65,
              ),
              CustomTextField(
                keyboardType: TextInputType.number,
                  label: "আপনার ফোন নম্বর দিন",
                  hint: "আপনার ফোন নম্বর দিন",
                  require: true,
                  onChange: (String value) {
                    debugPrint("$value");
                  }),
              const SizedBox(
                height: 32.0,
              ),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  onClick: () {
                    _formKey.currentState!.validate();
                  },
                  title: 'সাবমিট করুন',
                  loading: loading,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  const Text(
                    'আইডি আছে ?',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      // fontFamily: 'HindSiliguri ',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(VerifyOtpPage());
                    },
                    child: const GradientText(
                      "লগইন করুন",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )
            ],
          ),
        ),
      ]),
    )));
  }
}
