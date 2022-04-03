import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rcc/screens/profile/notice.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_text_field.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({Key? key}) : super(key: key);

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: NewGradientAppBar(
      //     automaticallyImplyLeading: false,
      //     titleSpacing: 3.0,
      //     elevation: 15.0,
      //     leading: const BackButton(),
      //     title: const Text('প্রোফাইল'),
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
              CustomButton(onClick: () {
                Get.to(const NoticePage());
              }, title: 'ট্রাক করুন')
            ],
          ),
        ),
      ),
    );
  }
}
