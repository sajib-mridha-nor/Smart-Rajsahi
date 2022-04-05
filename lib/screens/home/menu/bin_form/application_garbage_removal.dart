import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

class ApplicationGarbageRemoval extends StatefulWidget {
  const ApplicationGarbageRemoval({Key? key}) : super(key: key);

  @override
  State<ApplicationGarbageRemoval> createState() => _ApplicationGarbageRemovalState();
}

class _ApplicationGarbageRemovalState extends State<ApplicationGarbageRemoval> {
  final _items = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 3.0,
          elevation: 15.0,
          leading: const BackButton(),
          title: const Text('বর্জ্য ব্যবস্থাপনা বিভাগ'),
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
                  "আবর্জনা অপসারণের জন্য আবেদন",
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
              CustomTextField(
                  label: 'রেজিস্ট্রেশান কারির নাম ',
                  hint: 'Jannatul Ferdous',
                  onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'আবেদনকারীর নাম', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                        label: 'আবেদনকারীর মোবাইল নাম্বার',
                        hint: '',
                        onChange: () {}),
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
                        label: 'হোল্ডিং নম্বর', hint: '', onChange: () {}),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomDropdown(
                        label: "এলাকা/মহল্লার নাম",
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
              CustomTextField(label: 'জায়গার বিবরণ', hint: '', onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'যে ধরণের মালামাল অপসারণ করা হবে',
                  hint: '',
                  onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'যে স্থান হতে অপসারণ করা হবে',
                  hint: '',
                  onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'সিটি কর্পোরেশনের নির্ধারিত স্থান',
                  hint: '',
                  onChange: () {}),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'ভাড়া গ্রহণকারীর নিজস্ব স্থান',
                  hint: '',
                  onChange: () {}),

              const SizedBox(
                height: 8.0,
              ),
              CustomButton(onClick: () {}, title: 'সাবমিট')
            ],
          ),
        ),
      ),
    );
  }
}
