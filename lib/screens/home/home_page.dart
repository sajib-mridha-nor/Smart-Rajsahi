import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/section/academic_page.dart';
import 'package:rcc/screens/section/bin_page.dart';
import 'package:rcc/screens/section/engineering_page.dart';
import 'package:rcc/screens/section/health_page.dart';
import 'package:rcc/screens/section/revenue_page.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const CustomBanner(),
          const SizedBox(
            height: 16,
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(const AcademicPage());
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      child: Column(
                        children: const <Widget>[
                          ImageIcon(
                            AssetImage("assets/images/academic.png"),
                            color: Colors.orange,
                            size: 30,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "প্রশাসনিক বিভাগ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                    ),
                    elevation: 6,
                    shadowColor: Colors.black54,
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(const RevenuePage());
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      child: Column(
                        children: const <Widget>[
                          ImageIcon(
                            AssetImage("assets/images/revenue.png"),
                            color: Colors.green,
                            size: 30,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "রাজস্ব বিভাগ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                    ),
                    elevation: 6,
                    shadowColor: Colors.black54,
                  ),
                )),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(const EngineeringPage());
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      child: Column(
                        children: const <Widget>[
                          ImageIcon(
                            AssetImage("assets/images/engineering.png"),
                            color: Colors.orange,
                            size: 30,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "প্রকৌশল বিভাগ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                    ),
                    elevation: 6,
                    shadowColor: Colors.black54,
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(const HealthPage());
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      child: Column(
                        children: const <Widget>[
                          ImageIcon(
                            AssetImage("assets/images/health.png"),
                            color: Colors.red,
                            size: 30,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "স্বাস্থ্য বিভাগ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                    ),
                    elevation: 6,
                    shadowColor: Colors.black54,
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                Get.to(const BinPage());
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 6,
                shadowColor: Colors.black54,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: Column(
                    children: const <Widget>[
                      ImageIcon(
                        AssetImage("assets/images/clean.png"),
                        color: Colors.grey,
                        size: 24,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "বর্জ্য ব্যবস্থাপনা বিভাগ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              //  borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/images/emergencybanner.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
