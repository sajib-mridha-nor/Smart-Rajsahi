import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

class ApplyShopSubletFormPage extends StatefulWidget {
  const ApplyShopSubletFormPage({Key? key}) : super(key: key);

  @override
  State<ApplyShopSubletFormPage> createState() =>
      _ApplyShopSubletFormPageState();
}

class _ApplyShopSubletFormPageState extends State<ApplyShopSubletFormPage> {
  final _items = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];
  var createApplyShopSubletDoc = <String, dynamic>{};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 3.0,
          elevation: 15.0,
          leading: const BackButton(),
          title: const Text('রাজস্ব বিভাগ'),
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
              const GradientText(
                "দোকান সাবলেটের জন্য আবেদন",
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
                        label: 'আবেদনকারীর নাম', hint: '',

                        onChange: (value) {
                          createApplyShopSubletDoc["register_name"] =
                              value;
                        }

                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        keyboardType: TextInputType.number,
                        label: 'মোবাইল/টেলিফোন নাম্বার',
                        hint: '',
                        onChange: (value) {
                          createApplyShopSubletDoc["mobile_number"] =
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
                        label: "মার্কেটের নাম",
                        items: _items,
                        hint: "------",
                        require: true,
                        onChange: (String? value) {
                          debugPrint("$value");
                        }),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "তলা",
                        items: _items,
                        hint: "1",
                        require: true,
                        onChange: (String? value) {
                          debugPrint("$value");
                        }),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "দোকান নং",
                        items: _items,
                        hint: "-----",
                        require: true,
                        onChange: (String? value) {
                          debugPrint("$value");
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
                        label: 'মালিকের নাম', hint: '',   onChange: (value) {
                      createApplyShopSubletDoc["owner_name"] =
                          value;
                    }),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'সাল', hint: '2022',   onChange: (value) {
                      createApplyShopSubletDoc["year"] =
                          value;
                    }),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                  label: 'অসুবিধার কারণ  ', hint: '',   onChange: (value) {
                createApplyShopSubletDoc["cause_inconvenience"] =
                    value;
              }),
              const SizedBox(
                height: 8,
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
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              CustomButton(onClick: () {
                print(createApplyShopSubletDoc.toString());
              }, title: 'সাবমিট')
            ],
          ),
        ),
      ),
    );
  }
}
