import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rcc/screens/splash/splash_controller.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/gradient_text.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController? _breathingController;
  var _breathe = 0.0;
  String version = "";
  final _controller = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
    _breathingController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _breathingController?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _breathingController?.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _breathingController?.forward();
      }
    });
    _breathingController?.addListener(() {
      setState(() {
        _breathe = _breathingController!.value;
      });
    });
    _breathingController?.forward();

    _getPackageInfo();
  }

  void _getPackageInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
    });
  }

  @override
  void dispose() {
    _breathingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = 120.0 - 20.0 * _breathe;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")]),
          ),
        ),
      ),
      body: _controller.obx(
          (state) => Container(),
          onLoading: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 32,
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: size,
                        height: size,
                      ),
                    ),
                    const GradientText(
                      'স্মার্ট রাজশাহী',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    "v" + version,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
          onError: (e) => const Text("Error")),
    );
  }
}
