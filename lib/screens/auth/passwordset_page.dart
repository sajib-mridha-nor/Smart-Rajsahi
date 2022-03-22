import 'package:flutter/material.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_text_field.dart';

class PasswordSetPage extends StatefulWidget {
  const PasswordSetPage({Key? key}) : super(key: key);

  @override
  State<PasswordSetPage> createState() => _PasswordSetPageState();
}

class _PasswordSetPageState extends State<PasswordSetPage> {
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
                  label: "পাসওয়ার্ড সেট করুন ",
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
                  title: 'সাইন আপ',
                  loading: loading,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ]),
    )));
  }
}
