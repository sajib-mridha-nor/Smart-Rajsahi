import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/auth/controller/auth_controller.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {


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
          title: const Text('পাসওয়ার্ড পুনুরুদ্ধার'),
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
                    CustomTextField(
                        keyboardType: TextInputType.number,
                        label: "আপনার ফোন নম্বর দিন",
                        hint: "11 সংখ্যার ফোন নম্বর লিখুন",
                        require: true,
                        initialValue: "01569123057",
                        maxLength: 11,
                        minLength: 11,
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
                            _authController.forgotPassword(mobile);
                          }
                        },
                        title: 'সাবমিট করুন',
                        loading: _authController.forgotPasswordLoading.value,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
            ),
          ))),
    );
  }
}
