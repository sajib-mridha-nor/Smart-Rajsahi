import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/profile/controller/profile_controller.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_text_field.dart';

class ProfileInfoChangePage extends StatefulWidget {
  const ProfileInfoChangePage({Key? key}) : super(key: key);

  @override
  State<ProfileInfoChangePage> createState() => _ProfileInfoChangePageState();
}

class _ProfileInfoChangePageState extends State<ProfileInfoChangePage> {

  final _formKey = GlobalKey<FormState>();
  final _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text(
          "তথ্য পরিবর্তন করুন",
          style: GoogleFonts.hindSiliguri(),
        ),
        gradient: LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")]),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                      label: "আপনার পরিবর্তনের কারণ বিস্তারিত লিখুন",
                      hint: "বিস্তারিত লিখুন",
                      maxLines: 5,
                      textInputAction: TextInputAction.next,
                      onChange: (value) {
                        _controller.addChangeInfoField("details", value);
                      }),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                      label: "জাতীয় পরিচয়পত্রের নং",
                      hint: "জাতীয় পরিচয়পত্রের নং",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onChange: (value) {
                        _controller.addChangeInfoField("nid_no", value);
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFilePicker(
                    label: "জাতীয় পরিচয়পত্রের সম্মুখভাগ",
                    hint: "নির্বাচন করুন",
                    onChange: (file) async {
                      _controller.addChangeInfoField(
                          "nid_font", file.path);
                    },
                    maxFileSize: 1.5,
                    allowedExtensions: const ["png", "jpg", "jpeg"],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFilePicker(
                    label: "জাতীয় পরিচয়পত্রের পেছনের অংশ",
                    hint: "নির্বাচন করুন",
                    onChange: (file) async {
                      _controller.addChangeInfoField(
                          "nid_back",file.path);
                    },
                    maxFileSize: 1.5,
                    allowedExtensions: const ["png", "jpg", "jpeg"],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFilePicker(
                    label: "ব্যক্তির ছবি",
                    hint: "নির্বাচন করুন",
                    onChange: (file) async {
                      _controller.addChangeInfoField(
                          "profile_picture",file.path);
                    },
                    maxFileSize: 1,
                    allowedExtensions: const ["png", "jpg", "jpeg"],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Obx(()=> CustomButton(
                    onClick: () {
                      if(_formKey.currentState!.validate()){
                        _controller.changeProfileInfo();
                      }
                    },
                    title: "পরবর্তী",
                    loading: _controller.changingInfoLoading.value,
                  )),
                ],
              )),
        ),
      ),
    );
  }
}
