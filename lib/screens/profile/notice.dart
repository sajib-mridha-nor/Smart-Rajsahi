import 'package:flutter/material.dart';
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
          titleSpacing: 12.0,
          elevation: 15.0,
          // leading: const BackButton(),
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
              const Divider(
                thickness: 3,
                color: Colors.orange,
              ),
              const Card(
                color: Colors.white70,
                elevation: 9,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    side: BorderSide(width: 5, color: Colors.white70)),
                child: ListTile(
                  title: Text(
                      'রাজশাহী জেলা প্রশাসকের কার্যালয়ের ভিপি কেস নং-৭২-৬৭ ও মেমো নং-৫৯৭(২) তারিখঃ ৩১.০৩.১৯৮২ মাধ্যমে সাগরপাড়া তফসিল বর্ণিত সম্পত্তি-বাড়ি রাজশাহী সিটি কর্পোরেশনের অনুকূলে লীজ প্রদান প্রসঙ্গে \n২০ এপ্রিল, ২০২২'),
                ),
              ),
              const Divider(
                thickness: 3,
                color: Colors.orange,
              ),
              Card(
                color: Colors.white70,
                elevation: 9,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(width: 5, color: Colors.white70)),
                child: const ListTile(
                  title: Text(
                      'রাজশাহী জেলা প্রশাসকের কার্যালয়ের ভিপি কেস নং-৭২-৬৭ ও মেমো নং-৫৯৭(২) তারিখঃ ৩১.০৩.১৯৮২ মাধ্যমে সাগরপাড়া তফসিল বর্ণিত সম্পত্তি-বাড়ি রাজশাহী সিটি কর্পোরেশনের অনুকূলে লীজ প্রদান প্রসঙ্গে \n২০ এপ্রিল, ২০২২'),
                ),
              ),
              const Divider(
                thickness: 3,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
