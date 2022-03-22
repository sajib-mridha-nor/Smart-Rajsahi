import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: NewGradientAppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 18.0,
          elevation: 15.0,
          title: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 8, 10, 8),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('https://smartrajshahi.gov.bd/static/mainsite/img/logo/logo.png',
                    ),
                  ),
                  decoration: new BoxDecoration(
                    border: new Border.all(
                      color: Colors.orange,
                      width: 1.0,
                    ),
                    borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                  ),),
                Text('স্মার্ট রাজশাহী',
                    style: TextStyle(color: Colors.white,
                        fontFamily: 'HindSiliguri',
                        fontSize: 17,
                        fontWeight: FontWeight.w400)
                ),

              ]
          ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 14.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  MdiIcons.bellRing,
                  color: Colors.white,
                  size: 24.0,
                ),
              )
          ),

        ],
          gradient: LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")])

      ),
        body: ListView(
            children: [
              Container(
                //padding: EdgeInsets.all(5),
                height: 112,
                width: 375,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(13.0),

                    bottomRight: Radius.circular(13.0),
                  ),
                  //  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage('https://smartrajshahi.gov.bd/media/main-banners/RCC_BANNER_06.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),

              ),
              SizedBox(
                height: 32,
              ),

              Row(

                children: [
                  Card(
                    child: Image.asset('assets/images/img.png'),

                  ),
                  SizedBox(
                    width: 120,
                  ),
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/image.png"),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      child: Text("YOUR TEXT"),
                    ),
                  ),




                  Card(
                    child: Icon(
                        Icons.settings
                    ),
                  ),
                ],
              )
            ]
        )
    );
  }
}

