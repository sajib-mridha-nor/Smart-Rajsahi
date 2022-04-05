import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rcc/screens/auth/controller/auth_controller.dart';
import 'package:rcc/screens/auth/register/send_otp_page.dart';
import 'package:rcc/screens/auth/reset_password/forgot_password_page.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

class LoginPage extends StatefulWidget {
  final String? mobile;

  const LoginPage({Key? key, this.mobile}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? mobile;
  String? password;
  final _authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    setState(() {
      mobile = mobile;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")]),
            ),
          ),
        ),
        body: SafeArea(
            child: Obx(() => SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 32,
                              ),
                              Center(
                                child: Image.asset(
                                  'assets/images/logo.png',
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
                                height: 50,
                              ),
                              CustomTextField(
                                  keyboardType: TextInputType.number,
                                  label: "আপনার ফোন নম্বর দিন",
                                  hint: "আপনার ফোন নম্বর দিন",
                                  require: true,
                                  maxLength: 11,
                                  textInputAction: TextInputAction.next,
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
                                height: 16.0,
                              ),
                              CustomTextField(
                                  isPasswordField: true,
                                  label: "আপনার পাসওয়ার্ড দিন",
                                  hint: "পাসওয়ার্ড  দিন",
                                  error:
                                      'পাসওয়ার্ড অবশ্যই কমপক্ষে 8 অক্ষর হতে হবে',
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.visiblePassword,
                                  require: true,
                                  minLength: 8,
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      letterSpacing: 1.2),
                                  onChange: (String value) {
                                    setState(() {
                                      password = value.trim();
                                    });
                                  }),
                              const SizedBox(
                                height: 32.0,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: CustomButton(
                                  onClick: () {
                                    if (_formKey.currentState!.validate()) {
                                      //clear focus
                                      FocusScope.of(context).unfocus();
                                      TextEditingController().clear();
                                      //login
                                      _authController.login(mobile, password);
                                    }
                                  },
                                  title: 'লগইন করুন',
                                  loading: _authController.loginLoading.value,
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'পাসওয়ার্ড ভুলে গেছেন? ',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      // fontFamily: 'HindSiliguri ',
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const ForgotPasswordPage());
                                    },
                                    child: const GradientText(
                                      "পুনরায় সেট করুন",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          children: [
                            const Text(
                              'আইডি না থাকলে ?  ',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const SendOtpPage());
                              },
                              child: const GradientText(
                                "অ্যাকাউন্ট তৈরি করুন",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        const SizedBox(
                          height: 32,
                        )
                      ],
                    ),
                  ),
                ))));
  }
}
