import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rcc/screens/profile/controller/profile_controller.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart' as dio;

class ProfileCreateStepTwoPage extends StatefulWidget {
  const ProfileCreateStepTwoPage({Key? key}) : super(key: key);

  @override
  State<ProfileCreateStepTwoPage> createState() =>
      _ProfileCreateStepTwoPageState();
}

class _ProfileCreateStepTwoPageState extends State<ProfileCreateStepTwoPage> {

  final _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
                label: "জাতীয় পরিচয়পত্রের নং",
                hint: "জাতীয় পরিচয়পত্রের নং",
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onChange: (value) {
                  _controller.addCreateField("nid_no", value);
                }),
            const SizedBox(
              height: 10,
            ),
            CustomFilePicker(
              label: "জাতীয় পরিচয়পত্রের সম্মুখভাগ",
              hint: "নির্বাচন করুন",
              onChange: (file) async {
                _controller.addCreateField(
                    "nid", file.path);
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
                _controller.addCreateField(
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
                _controller.addCreateField(
                    "profile_picture",file.path);
              },
              maxFileSize: 1,
              allowedExtensions: const ["png", "jpg", "jpeg"],
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
