import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rcc/screens/profile/controller/profile_controller.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_text_field.dart';

class ProfileCreateStepThreePage extends StatefulWidget {
  const ProfileCreateStepThreePage({Key? key}) : super(key: key);

  @override
  State<ProfileCreateStepThreePage> createState() =>
      _ProfileCreateStepThreePageState();
}

class _ProfileCreateStepThreePageState
    extends State<ProfileCreateStepThreePage> {
  String? selectedMoholla;
  final _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {


    return Obx(() => SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                    label: "ঠিকানা",
                    hint: "ঠিকানা লিখুন",
                    maxLines: 2,
                    textInputAction: TextInputAction.next,
                    onChange: (value) {
                      _controller.addCreateField("address", value);
                    }),
                const SizedBox(
                  height: 10,
                ),
                CustomDropdown(
                  label: "ওয়ার্ড",
                  items: _controller.wards
                      .map((e) => e!.wardNoBangla.toString())
                      .toList(),
                  hint: "নির্বাচন করুন",
                  onChange: (value) {

                    final item = _controller.wards.firstWhere((element) =>
                        element?.wardNoBangla.toString().trim() ==
                        value.toString().trim());
                    _controller.filterMohollas(item?.id);
                    _controller.addCreateField("citizen_ward", item?.id.toString());
                  },
                  initialValue: _controller.createProfileDoc["citizen_ward"],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomDropdown(
                  label: "থানা",
                  items: _controller.thanas
                      .map((e) => e!.thanaBangla.toString())
                      .toList(),
                  hint: "নির্বাচন করুন",
                  onChange: (value) {
                    final item = _controller.thanas.firstWhere((element) =>
                        element?.thanaBangla.toString().trim() ==
                        value.toString().trim());
                    _controller.addCreateField("thana", item?.id.toString());
                  },
                  initialValue: _controller.createProfileDoc["thana"],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomDropdown(
                    label: "মহল্লা",
                    items: _controller.filteredMohollas.value,
                    hint: "নির্বাচন করুন",
                    onChange: (value) {
                      final item = _controller.mohollas.firstWhere((element) =>
                          element?.mohallaBangla.toString().trim() ==
                          value.toString().trim());
                      _controller.addCreateField("moholla", item?.id.toString());
                    },
                    initialValue: _controller.createProfileDoc["moholla"]),
              ],
            ),
          ),
        ));
  }
}
