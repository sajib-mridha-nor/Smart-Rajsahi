import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/home/home_page.dart';
import 'package:rcc/screens/notification/notification_page.dart';
import 'package:rcc/screens/notice/notice_page.dart';
import 'package:rcc/screens/profile/profile_page.dart';
import 'package:rcc/screens/tracking/tracking_page.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pages = [
    const HomePage(),
    const TrackingPage(),
    const NoticePage(),
    const ProfilePage()
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          automaticallyImplyLeading: false,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  "assets/images/logo.png",
                  height: 35,
                  width: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Text('স্মার্ট রাজশাহী',
                      style:
                      GoogleFonts.hindSiliguri(fontWeight: FontWeight.bold, fontSize: 22)),
                ),
                const SizedBox(
                  width: 0,
                  height: 0,
                )
              ]),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => const NotificationPage());
                },
                icon: const Icon(
                  MdiIcons.bellRing,
                  color: Colors.white,
                  size: 24.0,
                ))
          ],
          gradient:
              LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")])),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (i) {
          setState(() {
            _selectedIndex = i;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'হোম',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'ট্র্যাকিং',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'নোটিশসমূহ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'প্রোফাইল',
          ),
        ],
      ),
    );
  }
}
