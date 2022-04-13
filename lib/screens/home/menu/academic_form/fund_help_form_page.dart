import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/home/menu/academic_form/controller/academic_controller.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_text_field.dart';

class FundHelpFormPage extends StatefulWidget {
  const FundHelpFormPage({Key? key}) : super(key: key);

  @override
  State<FundHelpFormPage> createState() => _FundHelpFormPageState();
}

class _FundHelpFormPageState extends State<FundHelpFormPage> {
  final _controller = Get.put(AcademicController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          title: const Text("আর্থিক সহায়তা প্রদান"),
          gradient:
              LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")])),
      body: Obx(()=> SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
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
                  '${_controller.profile?.name}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      letterSpacing: 1.2),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                    label: "টাকার পরিমাণ",
                    hint: "টাকার পরিমাণ লিখুন",
                    maxLines: 1,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    keyboardType: TextInputType.number,
                    require: true,
                    onChange: (value) {
                      _controller.addFundHelpDoc("amount", value);
                    }),
                const SizedBox(
                  height: 8.0,
                ),
                CustomTextField(
                    maxLines: 10,
                    label:
                    'যে সম্পর্কে আর্থিক সহায়তা প্রয়োজন সে সম্পর্কে বিস্তারিত লিখুন   ',
                    hint: 'এখানে লিখুন',
                    onChange: (value) {
                      _controller.addFundHelpDoc("des", value);
                    }),
                const SizedBox(
                  height: 32.0,
                ),
                CustomButton(
                  onClick: () {
                    if (_formKey.currentState!.validate()) {
                      _controller.fundHelpFormSubmit();
                    }
                  },
                  title: 'সাবমিট',
                  loading: _controller.submitLoading.value,
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
