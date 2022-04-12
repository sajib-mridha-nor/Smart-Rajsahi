import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rcc/screens/profile/controller/profile_controller.dart';
import 'package:rcc/widgets/custom_date_picker.dart';
import 'package:rcc/widgets/custom_text_field.dart';

class ProfileCreateStepOnePage extends StatefulWidget {
  const ProfileCreateStepOnePage({Key? key}) : super(key: key);

  @override
  State<ProfileCreateStepOnePage> createState() =>
      _ProfileCreateStepOnePageState();
}

class _ProfileCreateStepOnePageState extends State<ProfileCreateStepOnePage> {
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
                label: "নাম (বাংলাতে লিখুন)",
                hint: "পুরো নাম",
                textInputAction: TextInputAction.next,
                onChange: (value) {
                  _controller.addCreateField("name", value);
                }),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                label: "নাম (ইংরেজিতে লিখুন)",
                hint: "পুরো নাম",
                textInputAction: TextInputAction.next,
                onChange: (value) {
                  _controller.addCreateField("name_english", value);
                }),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                label: "মাতার নাম",
                hint: "পুরো নাম",
                textInputAction: TextInputAction.next,
                onChange: (value) {
                  _controller.addCreateField("mothers_name", value);
                }),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                label: "মাতার নাম (ইংরেজিতে লিখুন)",
                hint: "পুরো নাম",
                textInputAction: TextInputAction.next,
                onChange: (value) {
                  _controller.addCreateField("mothers_name_english", value);
                }),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                label: "পিতার নাম",
                hint: "পুরো নাম",
                textInputAction: TextInputAction.next,
                onChange: (value) {
                  _controller.addCreateField("fathers_name", value);
                }),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                label: "পিতার নাম (ইংরেজিতে লিখুন)",
                hint: "পুরো নাম",
                textInputAction: TextInputAction.next,
                onChange: (value) {
                  _controller.addCreateField("fathers_name_english", value);
                }),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                label: "ইমেইল অ্যাড্রেস",
                hint: "ইমেইল লিখুন",
                textInputAction: TextInputAction.next,
                onChange: (value) {
                  _controller.addCreateField("email", value);
                }),
            const SizedBox(
              height: 10,
            ),
            CustomDatePicker(
              label: "জন্ম তারিখ",
              hint: "জন্ম তারিখ লিখুন",
              onChange: (value) {
                var parts = value!.split('-');
                //01-01-1991 Dummy
                final date = parts[2].trim()+"-"+parts[1].trim()+"-"+parts[0].trim();
                _controller.addCreateField("date_of_birth", date);
              },
              dateMask: "dd-MM-yyyy",
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
