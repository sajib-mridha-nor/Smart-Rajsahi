import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/profile/tracking.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_card_text.dart';
import 'package:rcc/widgets/gradient_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 12.0,
          elevation: 15.0,
          // leading: const BackButton(),
          title: const Text('প্রোফাইল'),
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
              ListTile(
                leading: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 64,
                    maxHeight: 64,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://imageio.forbes.com/specials-images/imageserve/5ec595d45f39760007b05c07/0x0.jpg?format=jpg&crop=1491,1490,x989,y74,safe&fit=crop',
                      height: 150.0,
                      width: 100.0,
                    ),
                  ),
                ),
                title: const GradientText('মুশফিক জামিল '),
                subtitle: const Text(
                    '০১৭৭২ ০০ ০০ ০০\nওয়ার্ড: ০৯, উপশহর হাউজিং এস্টেট, থানা: বোয়ালিয়া'),
                trailing: const Icon(MdiIcons.pencil),
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
              const GradientText('অ্যাকাউন্ট'),
              const CustomCardText(
                  title: 'এনআইডি নম্বর পরিবর্তন',
                  icon: ('assets/images/groupicon2.png')),
              const CustomCardText(
                  title: 'পাসওয়ার্ড পরিবর্তন করুন  ',
                  icon: ('assets/images/groupicon2.png')),
              const SizedBox(
                height: 8.0,
              ),
              const GradientText('সেটিং'),
              const CustomCardText(
                  title: 'ভাষা পরিবর্তন',
                  icon: ('assets/images/groupicon2.png')),
              const CustomCardText(
                  title: 'পাসওয়ার্ড পরিবর্তন করুন  ',
                  icon: ('assets/images/groupicon2.png')),
              const SizedBox(
                height: 8.0,
              ),
              const GradientText('আরও'),
              const CustomCardText(
                  title: 'গোপনীয়তা ও নীতি',
                  icon: ('assets/images/groupicon2.png')),
              const CustomCardText(
                  title: 'শর্তাবলী ', icon: ('assets/images/groupicon2.png')),
              GestureDetector(
                onTap: () {
                  Get.to(const TrackingPage());
                },
                child: const CustomCardText(
                    title: 'রাজশাহী সিটি কর্পোরেশন ',
                    icon: ('assets/images/groupicon2.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
