import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/home/home_page.dart';
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
    const HomePage(),
    const HomePage(),
    const HomePage()
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewGradientAppBar(
            automaticallyImplyLeading: false,
            title: Row(children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 8, 10, 8),
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/logo.png"),
                ),
              ),
              const Text('স্মার্ট রাজশাহী',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ]),
            actions: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    MdiIcons.bellRing,
                    color: Colors.white,
                    size: 24.0,
                  )),
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
              icon: Icon(Icons.call),
              label: 'হোম',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'ট্র্যাকিং',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'নোটিশ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'প্রোফাইল',
            ),
          ],
        ));
  }
}
