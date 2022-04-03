import 'package:flutter/material.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 3.0,
          elevation: 15.0,
          leading: const BackButton(),
          title: const Text('নোটিশ'),
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
                height: 60.0,
              ),
              Container(
                  width: 150.00,
                  height: 150.00,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/tra.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  )),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                'আবেদন ট্র্যাকিং করতে আপনার ফোন ও আবেদন নাম্বার দিন',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              CustomTextField(
                  label: 'আপনার ফোন নাম্বার দিন',
                  hint: 'ফোন নাম্বার দিন',
                  onChange: () {}),
              const SizedBox(
                height: 16.0,
              ),
              CustomTextField(
                  label: 'আপনার আবেদন নম্বর দিন',
                  hint: 'আবেদন নম্বর দিন',
                  onChange: () {}),
              const SizedBox(
                height: 24.0,
              ),
              CustomButton(onClick: () {}, title: 'ট্রাক করুন')
            ],
          ),
        ),
      ),
    );
  }
}
