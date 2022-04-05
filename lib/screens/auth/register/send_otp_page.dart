import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/auth/controller/auth_controller.dart';
import 'package:rcc/screens/auth/register/verify_otp_page.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

class SendOtpPage extends StatefulWidget {
  const SendOtpPage({Key? key}) : super(key: key);

  @override
  State<SendOtpPage> createState() => _SendOtpPageState();
}

class _SendOtpPageState extends State<SendOtpPage> {

  String? mobile;
  final _authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    setState(() {
      mobile = "01569123057";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewGradientAppBar(
            title: const Text('অ্যাকাউন্ট তৈরি করুন'),
            gradient:
            LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")])),
        body: SafeArea(
            child: Obx(() => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      // Center(
                      //   child: Image.network(
                      //     'https://smartrajshahi.gov.bd/static/mainsite/img/logo/logo.png',
                      //     width: 85,
                      //     height: 85,
                      //   ),
                      // ),
                      // Container(
                      //     alignment: Alignment.center,
                      //     padding: const EdgeInsets.all(10),
                      //     child: const Text(
                      //       'স্মার্ট রাজশাহী',
                      //       style: TextStyle(
                      //         fontSize: 24,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     )),
                      // const SizedBox(
                      //   height: 65,
                      // ),
                      CustomTextField(
                          keyboardType: TextInputType.number,
                          label: "আপনার ফোন নম্বর দিন",
                          hint: "আপনার ফোন নম্বর দিন",
                          require: true,
                          initialValue: "01569123057",
                          maxLength: 11,
                          textInputAction: TextInputAction.done,
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              letterSpacing: 1.2),
                          onChange: (String value) {
                            setState(() {
                              mobile = value.trim();
                            });
                          }),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          onClick: () {
                            if(_formKey.currentState!.validate()){
                              //clear focus
                              FocusScope.of(context).unfocus();
                              TextEditingController().clear();
                              //send otp
                              _authController.sendOtp(mobile);
                            }
                          },
                          title: 'সাবমিট করুন',
                          loading: _authController.sendOtpLoading.value,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        children: [
                          const Text(
                            'আইডি আছে ? ',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              // fontFamily: 'HindSiliguri ',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const GradientText(
                              "লগইন করুন",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      )
                    ],
                  ),
                ),
              ),
            ))));
  }
}
