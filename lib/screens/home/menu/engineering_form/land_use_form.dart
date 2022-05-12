import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/home/menu/engineering_form/controller/land_controller.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_date_picker.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

class LandUseFormPage extends StatefulWidget {
  const LandUseFormPage({Key? key}) : super(key: key);

  @override
  State<LandUseFormPage> createState() => _LandUseFormPageState();
}

class _LandUseFormPageState extends State<LandUseFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = Get.put(LandUserControl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 3.0,
          elevation: 15.0,
          leading: const BackButton(),
          title: const Text('প্রকৌশল বিভাগ'),
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
        child: Obx(
          () => Container(
            margin: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
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
                      "ভূমি ব্যবহার অনাপত্তি ছাড়পত্রের জন্য আবেদন",
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
                      label: 'বর্তমান ঠিকানা ',
                      hint: '',
                      onChange: (value) {
                        _controller.addLandUserField("present_address", value);
                      }),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                      label: 'স্থায়ী ঠিকানা',
                      hint: '',
                      onChange: (value) {
                        _controller.addLandUserField(
                            "parmanent_address", value);
                      }),
                  const SizedBox(
                    height: 8,
                  ),
                  const GradientText(
                    "যে জমির জন্য অনাপত্তি ছাড়পত্র পেতে ইচ্ছুক তার তফসিল",
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
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: CustomTextField(
                            label: 'রাস্তার নাম/নং',
                            hint: '',
                            onChange: (value) {
                              _controller.addLandUserField(
                                  "road_name_no", value);
                            }),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        flex: 5,
                        child: CustomTextField(
                            label: 'মৌজার নাম',
                            hint: '',
                            onChange: (value) {
                              _controller.addLandUserField(
                                  "mowzar_name", value);
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
                          label: "এলাকা/মহল্লার নাম",
                          items: _controller.mohollas
                              .map((e) => e!.mohallaBangla.toString())
                              .toList(),
                          hint: "নির্বাচন করুন",
                          onChange: (value) {
                            final item = _controller.mohollas.firstWhere(
                                (element) =>
                                    element?.mohallaBangla.toString().trim() ==
                                    value.toString().trim());
                            _controller.addLandUserField(
                                "area_name", item?.id.toString());
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        flex: 5,
                        child: CustomDropdown(
                          label: "থানা",
                          items: _controller.thanas
                              .map((e) => e!.thanaBangla.toString())
                              .toList(),
                          hint: "নির্বাচন করুন",
                          onChange: (value) {
                            final item = _controller.thanas.firstWhere(
                                (element) =>
                                    element?.thanaBangla.toString().trim() ==
                                    value.toString().trim());
                            _controller.addLandUserField(
                                "thana_no", item?.id.toString());
                          },
                        ),
                      ),
                    ],
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
                            label: 'জেলার নাম',
                            hint: 'রাজশাহী',
                            onChange: (value) {
                              _controller.addLandUserField("zilla_name", value);
                            }),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        flex: 5,
                        child: CustomTextField(
                            label: 'জমির পরিমাণ',
                            hint: '',
                            onChange: (value) {
                              _controller.addLandUserField("land", value);
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: CustomTextField(
                            label: 'প্রস্তাবিত ভবনের তালার সংখ্যা',
                            hint: '',
                            maxLines: 1,
                            maxLength: 2,
                            keyboardType: TextInputType.number,
                            onChange: (value) {
                              _controller.addLandUserField(
                                  'number_of_floor', value);
                            }),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        flex: 5,
                        child: CustomTextField(
                            label: 'জে, এল, নং',
                            hint: '',
                            maxLines: 1,
                            maxLength: 2,
                            keyboardType: TextInputType.number,
                            onChange: (value) {
                              _controller.addLandUserField('jlno', value);
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: CustomTextField(
                            label: 'আর এস দাগ নং/প্লট নং',
                            hint: '',
                            maxLines: 1,
                            maxLength: 2,
                            onChange: (value) {
                              _controller.addLandUserField('rsno', value);
                            }),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        flex: 5,
                        child: CustomTextField(
                            label: 'আর এস দাগ নং/প্লট নং',
                            hint: '',
                            maxLines: 1,
                            maxLength: 2,
                            onChange: (value) {
                              _controller.addLandUserField(
                                  'rs_account_no', value);
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: CustomTextField(
                            label: 'ড্রাফট নং/পে অর্ডার নং',
                            hint: '',
                            maxLines: 1,
                            maxLength: 2,
                            keyboardType: TextInputType.number,
                            onChange: (value) {
                              _controller.addLandUserField('draft_no', value);
                            }),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        flex: 5,
                        child: CustomDatePicker(
                            label: 'কাজের তারিখ',
                            hint: 'সিলেক্ট করুন',
                            dateMask: "dd-MM-yyyy",
                            onChange: (value) {
                              var parts = value!.split('-');
                              //01-01-1991 Dummy
                              final date = parts[2].trim() +
                                  "-" +
                                  parts[1].trim() +
                                  "-" +
                                  parts[0].trim();

                              _controller.addLandUserField("pay_date", date);
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: CustomTextField(
                            label: 'ব্যাংকের নাম/শাখা',
                            hint: '',
                            onChange: (value) {
                              _controller.addLandUserField("bank_name", value);
                            }),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        flex: 5,
                        child: CustomTextField(
                            label: 'টাকার পরিমাণ',
                            hint: '',
                            maxLines: 1,
                            maxLength: 2,
                            keyboardType: TextInputType.number,
                            onChange: (value) {
                              _controller.addLandUserField('amount', value);
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Center(
                    child: Text(
                      'হলফনামা',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Text(
                    'বর্ণিত তথ্যাদি সঠিক। কোন রকম সত্য গোপন করা হয় নাই বা কোন মিথ্যা তথ্য প্রদান করা হয় নাই। পরবর্তীতে কোন বিষয় বা তথ্য স্বপক্ষে মিথ্যা প্রমাণিত হইলে আমার বিরুদ্ধে প্রচলিত আইনে ব্যবস্থা গ্রহণ করা যাইবে।',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                    //    width: 16,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  CustomButton(
                    onClick: () {
                      if (_formKey.currentState!.validate()) {
                        _controller.landUseFormSubmit();
                      }
                    },
                    title: 'সাবমিট',
                    loading: _controller.submitLoading.value,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
