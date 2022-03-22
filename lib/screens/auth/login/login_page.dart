import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rcc/screens/auth/verifyotp_page.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                        height: 40,
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
                        height: 50,
                      ),
                      CustomTextField(
                          label: "আপনার ফোন নম্বর দিন",
                          hint: "আপনার ফোন নম্বর দিন",
                          require: true,
                          onChange: (String value) {
                            debugPrint("$value");
                          }),
                    SizedBox(
                      height: 16.0,
                    ),
                      CustomTextField(
                          label: "আপনার পাসওয়ার্ড দিন",
                          hint: "পাসওয়ার্ড  দিন",
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
                          title: 'লগইন করুন',
                          loading: loading,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          const Text(
                            'পাসওয়ার্ড ভুলে গেছেন? ',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              // fontFamily: 'HindSiliguri ',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {

                            },
                            child: const GradientText(
                              "পুনরায় সেট করুন",
                              style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                      SizedBox(
                        height: 110,
                      ),
                      Row(
                        children: [
                          const Text(
                            'আইডি না থাকলে ?  ',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              // fontFamily: 'HindSiliguri ',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {

                            },
                            child: const GradientText(
                              "অ্যাকাউন্ট তৈরি করুন",
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
