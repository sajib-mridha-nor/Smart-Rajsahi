import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';
import 'dart:io';

class PremisessecoundPageForm extends StatefulWidget {
  const PremisessecoundPageForm({Key? key}) : super(key: key);

  @override
  State<PremisessecoundPageForm> createState() =>
      _PremisessecoundPageFormState();
}

class _PremisessecoundPageFormState extends State<PremisessecoundPageForm> {
  @override
  Widget build(BuildContext context) {
    final _items = [
      "1",
      "2",
      "3",
      "4",
      "5",
    ];
    var createPremisesRegistrationFirstPageDoc = <String, dynamic>{};
    return Scaffold(
      // appBar: NewGradientAppBar(
      //     automaticallyImplyLeading: false,
      //     titleSpacing: 3.0,
      //     elevation: 15.0,
      //     leading: const BackButton(),
      //     title: const Text('স্বাস্থ্য বিভাগ'),
      //     actions: <Widget>[
      //       Padding(
      //           padding: const EdgeInsets.only(right: 14.0),
      //           child: GestureDetector(
      //             onTap: () {},
      //             child: const Icon(
      //               MdiIcons.bellRing,
      //               color: Colors.white,
      //               size: 24.0,
      //             ),
      //           )),
      //     ],
      //     gradient:
      //     LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")])),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 16.0,
              ),
              GestureDetector(
                onTap: () {},

                // margin: const EdgeInsets.all(10.0),
                child: const GradientText(
                  "মালিকের ঠিকানা (স্থায়ী)",
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
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'হোল্ডিং নং',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc["holding_no"] =
                              value;
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'রাস্তার নাম',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc["road_name"] =
                              value;
                        }),
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
                    child: CustomDropdown(
                        label: "ওয়ার্ড নং",
                        items: _items,
                        hint: "-----",
                        require: true,
                        onChange: (String? value) {
                          debugPrint("$value");
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'মহল্লার নাম',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc[
                              "village_name"] = value;
                        }),
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
                        label: 'ব্লক',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc["block"] =
                              value;
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'থানা',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc["thana"] =
                              value;
                        }),
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
                        label: 'পোস্ট অফিস',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc[
                              "post office"] = value;
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "পোস্ট কোড",
                        items: _items,
                        hint: "",
                        require: true,
                        onChange: (String? value) {
                          debugPrint("$value");
                        }),
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
                        label: 'জেলা',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc["district"] =
                              value;
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'ফোন/মোবাইল',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc["mobile"] =
                              value;
                        }),
                  ),
                ],
              ),
              const GradientText(
                "মালিকের ঠিকানা (বর্তমান)",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'হোল্ডিং নং',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc[
                              "holding_no1"] = value;
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'রাস্তার নাম',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc["road_name1"] =
                              value;
                        }),
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
                    child: CustomDropdown(
                        label: "ওয়ার্ড নং",
                        items: _items,
                        hint: "-----",
                        require: true,
                        onChange: (String? value) {
                          debugPrint("$value");
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'মহল্লার নাম',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc[
                              "village_name1"] = value;
                        }),
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
                        label: 'ব্লক',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc["block1"] =
                              value;
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'থানা',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc["thana1"] =
                              value;
                        }),
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
                        label: 'পোস্ট অফিস',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc[
                              "post_office1"] = value;
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "পোস্ট কোড",
                        items: _items,
                        hint: "",
                        require: true,
                        onChange: (String? value) {
                          debugPrint("$value");
                        }),
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
                        label: 'জেলা',
                        hint: 'রাজশাহী',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc["district1"] =
                              value;
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'ফোন/মোবাইল',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc["mobile1"] =
                              value;
                        }),
                  ),
                ],
              ),
              const GradientText(
                "ব্যবসা প্রতিষ্ঠানের ঠিকানা",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'হোল্ডিং নং',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc[
                              "holding_no3"] = value;
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'রাস্তার নাম',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc["road_name1"] =
                              value;
                        }),
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
                    child: CustomDropdown(
                        label: "ওয়ার্ড নং",
                        items: _items,
                        hint: "-----",
                        require: true,
                        onChange: (String? value) {
                          debugPrint("$value");
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'মহল্লার নাম',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc[
                              "village_name2"] = value;
                        }),
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
                        label: 'ব্লক',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc["block2"] =
                              value;
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'থানা',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc["thana2"] =
                              value;
                        }),
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
                        label: 'পোস্ট অফিস',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc[
                              "post_office2"] = value;
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "পোস্ট কোড",
                        items: _items,
                        hint: "",
                        require: true,
                        onChange: (String? value) {
                          debugPrint("$value");
                        }),
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
                        label: 'জেলা',
                        hint: 'রাজশাহী',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc["district2"] =
                              value;
                        }),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'ফোন/মোবাইল',
                        hint: '',
                        onChange: (value) {
                          createPremisesRegistrationFirstPageDoc["mobile2"] =
                              value;
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
