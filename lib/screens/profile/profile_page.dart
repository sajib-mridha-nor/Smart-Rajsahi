import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rcc/models/profile.dart';
import 'package:rcc/screens/profile/profile_info_change_list_page.dart';
import 'package:rcc/screens/profile/profile_info_change_page.dart';
import 'package:rcc/screens/tracking/tracking_page.dart';
import 'package:rcc/widgets/custom_card_text.dart';
import 'package:rcc/widgets/gradient_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _box = GetStorage();
  Profile? _profile;

  @override
  void initState() {
    _getProfile();
    super.initState();
  }

  void _getProfile() async {
    final res = _box.read("profile");
    final profile = Profile.fromJson(res);
    setState(() {
      _profile = profile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 8.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                      imageUrl: "${_profile?.profilePicture}",
                      placeholder: (context, url) => Image.asset(
                        "assets/images/placeholder.jpg",
                        fit: BoxFit.cover,
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        "assets/images/placeholder.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GradientText(
                        "${_profile?.name}",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${_profile?.username}",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'ওয়ার্ড: ${_profile?.citizenWard}, ${_profile?.moholla}, থানা: ${_profile?.thana}',
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  )),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      MdiIcons.pencil,
                      size: 20,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(
                thickness: 1,
                color: Colors.black12,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Icon(Icons.info_outline_rounded),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Text(
                          "আপনার প্রোফাইলটি এখনো ভেরিফাইড হয়নি. অ্যাডমিন থেকে আপনার প্রোফাইল ভেরিফাইড করা হবে."))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const GradientText('অ্যাকাউন্ট'),
              CustomCardText(
                title: 'এনআইডি নম্বর পরিবর্তন',
                icon: ('assets/images/groupicon2.png'),
                onTap: () {
                  Get.to(() => const ProfileInfoChangePage());
                },
              ),
              CustomCardText(
                title: 'তথ্য পরিবর্তন তালিকা',
                icon: ('assets/images/groupicon2.png'),
                onTap: () {
                  Get.to(() => const ProfileInfoChangeListPage());
                },
              ),
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
