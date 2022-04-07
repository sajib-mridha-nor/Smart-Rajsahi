import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';
import 'dart:io';

class AnswerEnvironmentalPollutionForm extends StatefulWidget {
  const AnswerEnvironmentalPollutionForm({Key? key}) : super(key: key);

  @override
  State<AnswerEnvironmentalPollutionForm> createState() =>
      _AnswerEnvironmentalPollutionFormState();
}

class _AnswerEnvironmentalPollutionFormState
    extends State<AnswerEnvironmentalPollutionForm> {
  @override
  Widget build(BuildContext context) {
    var createanswerEnvironmentDoc = <String, dynamic>{};
    return Scaffold(
      appBar: NewGradientAppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 3.0,
          elevation: 15.0,
          leading: const BackButton(),
          title: const Text('স্বাস্থ্য বিভাগ'),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    MdiIcons.bellRing,
                    color: Colors.white,
                    size: 24.0,
                  ),
                )),
          ],
          gradient:
              LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")])),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 8.0,
              ),
              GestureDetector(
                onTap: () {},

                // margin: const EdgeInsets.all(10.0),
                child: const GradientText(
                  "পরিবেশ দূষণ অভিযোগ এর উত্তর",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                indent: 1.0,
                color: Colors.grey,
                endIndent: 12.0,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomTextField(

                  label: 'রেজিস্ট্রেশান কারির নাম ',
                  hint: 'Jannatul Ferdous',
                  onChange: (value) {
                    createanswerEnvironmentDoc["register_name"] =
                        value;
                  }

                  ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'অভিযোগকারীর নাম', hint: '',
                        onChange: (value) {
                          createanswerEnvironmentDoc["complain_name"] =
                              value;
                        }

                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'অভিযোগকারীর মোবাইল', hint: '',
                        onChange: (value) {
                          createanswerEnvironmentDoc["complain_number"] =
                              value;
                        }

                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'সুস্পষ্ট আইডি থাকলে',
                        hint: '',
                        onChange: (value) {
                          createanswerEnvironmentDoc["complain_id"] =
                              value;
                        }
                        ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'অভিযুক্তের মোবাইল নং',
                        hint: '',
                        onChange: (value) {
                          createanswerEnvironmentDoc["complain_number"] =
                              value;
                        }

                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              CustomTextField(
                  maxLines: 8,
                  label: 'অভিযোগ বিস্তারিত',
                  hint: '',
                  onChange: (value) {
                    createanswerEnvironmentDoc["complain_about"] =
                        value;
                  }

              ),
              const SizedBox(
                height: 8,
              ),
              CustomFilePicker(
                label: "অভিযোগ বিষয়ক ছবি",
                hint: "Choose File",
                onChange: (File file) {
                  debugPrint("${file.path}");
                },
                require: true,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomButton(onClick: () {
                print(createanswerEnvironmentDoc.toString());
              }, title: 'সাবমিট')
            ],
          ),
        ),
      ),
    );
  }
}
