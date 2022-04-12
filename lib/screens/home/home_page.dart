import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rcc/models/development_photos_response.dart';
import 'package:rcc/screens/player/youtube_player_page.dart';
import 'package:rcc/screens/section/academic_page.dart';
import 'package:rcc/screens/section/bin_page.dart';
import 'package:rcc/screens/section/engineering_page.dart';
import 'package:rcc/screens/section/health_page.dart';
import 'package:rcc/screens/section/revenue_page.dart';
import 'package:rcc/screens/viewer/multiple_image_viewer_page.dart';
import 'package:rcc/widgets/custom_banner.dart';
import 'package:rcc/widgets/gradient_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'B0FgrYBE4uY',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  final _box = GetStorage();
  List<Photo>? developmentPhotos;

  @override
  void initState() {
    setState(() {
      developmentPhotos =
          DevelopmentPhotosResponse.fromJson(_box.read("dev_photos")).results;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          const CustomBanner(url: "https://rcc.tiger-park.com/media/main-banners/brand_image.jpeg",),
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
            height: 8,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: const [
                GradientText(
                  'ভিডিও',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 6,
              shadowColor: Colors.black54,
              child: InkWell(
                onTap: () {
                  Get.to(() => const YoutubePlayerPage());
                },
                child: IgnorePointer(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      progressColors: const ProgressBarColors(
                        playedColor: Colors.amber,
                        handleColor: Colors.amberAccent,
                      ),
                    ),
                  ),
                ),
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
                GradientText(
                  'উন্নয়নের চিত্র',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 422,
            height: 230,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    List.generate(developmentPhotos?.length ?? 0, (index) {
                  final item = developmentPhotos![index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => MultipleImageViewerPage(
                            galleryItems: developmentPhotos!
                                .map((e) => e.image.toString())
                                .toList(),
                            initialIndex: index,
                          ));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(12),
                      child: CachedNetworkImage(
                        width: 322,
                        imageUrl: "${item.image}",
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
                  );
                })),
          ),
        ]),
      ),
    );
  }
}
