import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/home/menu/bin_form/controller/garbage_controller.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

class ApplicationGarbageRemoval extends StatefulWidget {
  const ApplicationGarbageRemoval({Key? key}) : super(key: key);

  @override
  State<ApplicationGarbageRemoval> createState() =>
      _ApplicationGarbageRemovalState();
}

class _ApplicationGarbageRemovalState extends State<ApplicationGarbageRemoval> {
  final _controller = Get.put(GarbageController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          title: const Text('বর্জ্য ব্যবস্থাপনা বিভাগ'),
          gradient:
              LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")])),
      body: Obx(() => SingleChildScrollView(
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
                    const GradientText(
                      "আবর্জনা অপসারণের জন্য আবেদন",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      color: Colors.black26,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: CustomTextField(
                              label: 'আবেদনকারীর নাম',
                              hint: '',
                              maxLines: 1,
                              onChange: (value) {
                                _controller.addGarbageRemovalField(
                                    "applicant_name_form", value);
                              }),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 5,
                          child: CustomTextField(
                              label: 'আবেদনকারীর মোবাইল নাম্বার',
                              hint: '',
                              maxLines: 1,
                              maxLength: 11,
                              keyboardType: TextInputType.number,
                              onChange: (value) {
                                _controller.addGarbageRemovalField(
                                    "applicant_phone_no", value);
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
                              label: 'হোল্ডিং নম্বর',
                              hint: '',
                              keyboardType: TextInputType.number,
                              onChange: (value) {
                                _controller.addGarbageRemovalField(
                                    "holding_no", value);
                              }),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 5,
                          child:
                          CustomDropdown(
                            label: "এলাকা/মহল্লার নাম",
                            items: _controller.mohollas.value
                                .map((e) => e!.mohallaBangla.toString())
                                .toList(),
                            hint: "নির্বাচন করুন",
                            onChange: (value) {
                              final item = _controller.mohollas.value
                                  .firstWhere((element) =>
                                      element?.mohallaBangla
                                          .toString()
                                          .trim() ==
                                      value.toString().trim());
                              _controller.addGarbageRemovalField(
                                  "area_name", item?.id.toString());
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                        label: 'জায়গার বিবরণ',
                        hint: '',
                        onChange: (value) {
                          _controller.addGarbageRemovalField(
                              "place_details", value);
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                        label: 'যে ধরণের মালামাল অপসারণ করা হবে',
                        hint: '',
                        onChange: (value) {
                          _controller.addGarbageRemovalField(
                              "remove_cargo", value);
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                        label: 'যে স্থান হতে অপসারণ করা হবে',
                        hint: '',
                        onChange: (value) {
                          _controller.addGarbageRemovalField(
                              "remove_space", value);
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                        label: 'সিটি কর্পোরেশনের নির্ধারিত স্থান',
                        hint: '',
                        onChange: (value) {
                          _controller.addGarbageRemovalField(
                              "designated_place", value);
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                        label: 'ভাড়া গ্রহণকারীর নিজস্ব স্থান',
                        hint: '',
                        onChange: (value) {
                          _controller.addGarbageRemovalField(
                              "renter_own_space", value);
                        }),
                    const SizedBox(
                      height: 16.0,
                    ),
                    CustomButton(
                      onClick: () {
                        if (_formKey.currentState!.validate()) {
                          _controller.garbageRemoveFormSubmit();
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
