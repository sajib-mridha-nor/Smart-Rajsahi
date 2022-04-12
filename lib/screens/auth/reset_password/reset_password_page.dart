import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/auth/controller/auth_controller.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_text_field.dart';

class ResetPasswordPage extends StatefulWidget {
  final String mobile;
  const ResetPasswordPage({Key? key,required this.mobile}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

  final _formKey = GlobalKey<FormState>();
  String? otp;
  String? password;
  final _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          title: const Text('পাসওয়ার্ড রিসেট করুন'),
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
                        label: "আপনার ফোন কোডটি  দিন (ওটিপি) ",
                        hint: "আপনার ফোন কোডটি দিন",
                        require: true,
                        maxLength: 6,
                        error: 'ওটিপি অবশ্যই ৬ ডিজিট হতে হবে',
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            letterSpacing: 1.2),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        onChange: (String value) {
                          setState(() {
                            otp = value.trim();
                          });
                        }),
                    const SizedBox(
                      height: 16.0,
                    ),
                    CustomTextField(
                        isPasswordField: true,
                        label: "নতুন পাসওয়ার্ড দিন",
                        hint: "পাসওয়ার্ড  দিন",
                        error: 'পাসওয়ার্ড অবশ্যই কমপক্ষে 8 অক্ষর হতে হবে',
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        require: true,
                        minLength: 8,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            letterSpacing: 1.2),
                        onChange: (String value) {
                          password = value.trim();
                        }),
                    const SizedBox(
                      height: 32.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        onClick: () {
                          if(_formKey.currentState!.validate()){
                            //clear focus
                            FocusScope.of(context).unfocus();
                            TextEditingController().clear();
                            //verify otp
                            _authController.resetPassword(widget.mobile, otp, password);
                          }
                        },
                        title: 'সাবমিট করুন',
                        loading: _authController.resetPasswordLoading.value,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
          ))),
    );
  }
}
