import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rcc/screens/section/academic_page.dart';
import 'package:rcc/screens/section/bin_page.dart';
import 'package:rcc/screens/section/engineering_page.dart';
import 'package:rcc/screens/section/health_page.dart';
import 'package:rcc/screens/section/revenue_page.dart';
import 'package:rcc/widgets/custom_banner.dart';
import 'package:rcc/widgets/gradient_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
        child: Column(children: <Widget>[
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
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              // borderRadius: BorderRadius.circular(13.0),

              //  borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/images/emergencybanner.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: const [
                Text(
                  'ভিডিও',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                GradientText(
                  'আরও দেখুন',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                ImageIcon(
                  AssetImage(
                    'assets/images/more.png',
                  ),
                  size: 14,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
          Column(
            children: [
              SafeArea(
                  child: SizedBox(
                width: 422,
                height: 280,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Container(
                    margin: const EdgeInsets.all(12),
                    width: 322,
                    height: 117,
                    // color: Colors.amber,
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://rcc.tiger-park.com/media/devphotos/D-01.jpg",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white70,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(12),
                    width: 322,
                    height: 117,
                    // color: Colors.amber,
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://rcc.tiger-park.com/media/devphotos/D-01.jpg",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white70,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(12),
                    width: 322,
                    height: 117,
                    // color: Colors.amber,
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://rcc.tiger-park.com/media/devphotos/D-01.jpg",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white70,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ]),
              )),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: const [
                Text(
                  'উন্নয়নের চিত্র',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                GradientText(
                  'আরও দেখুন',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                ImageIcon(
                  AssetImage(
                    'assets/images/more.png',
                  ),
                  size: 14,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
          Column(
            children: [
              SafeArea(
                  child: SizedBox(
                width: 422,
                height: 330,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Container(
                    margin: const EdgeInsets.all(12),
                    width: 322,
                    height: 117,
                    // color: Colors.amber,
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://smartrajshahi.gov.bd/media/cache/f8/0e/f80eb70b5bf0a2454d7163009e5d2b72.jpg",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white70,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(12),
                    width: 322,
                    height: 117,
                    // color: Colors.amber,
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://smartrajshahi.gov.bd/media/cache/b4/37/b437257c02b080d6dbd08387335f3946.jpg",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white70,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: 322,
                    height: 117,
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://smartrajshahi.gov.bd/media/cache/1f/17/1f174174d8fb0652be84f935f53968a1.jpg",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ]),
              )),
            ],
          ),
        ]),
      ),
    );
  }
}
