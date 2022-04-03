import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/form%20design/health_form/premises_registration/premises_registration_1st_page.dart';
import 'package:rcc/screens/form%20design/health_form/premises_registration/premises_registration_2nd_page.dart';
import 'package:rcc/screens/form%20design/health_form/premises_registration/premises_registration_third_page.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_dropdown.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';
import 'dart:io';

class PremisesRegistrationFormPage extends StatefulWidget {
  const PremisesRegistrationFormPage({Key? key}) : super(key: key);

  @override
  State<PremisesRegistrationFormPage> createState() =>
      _PremisesRegistrationFormPageState();
}

class _PremisesRegistrationFormPageState
    extends State<PremisesRegistrationFormPage> {
  PageController controller = PageController();
  final List<Widget> _list = <Widget>[
    const Center(
      child: PremisesRegistrationFirstPage(),
      // child: Pages(
      //   text: "Page 1",
    ),
    const Center(
      child:PremisessecoundPageForm(),
      // child: Pages(
      //   text: "Page 1",
    ),
    const Center(
      child:PremisesThirdPageForm(),
      // child: Pages(
      //   text: "Page 1",
    ),
    // const Center(
    //   child: PremisessecoundPageForm(),
    //   // child: Pages(
    //   //   text: "Page 1",
    // ),
  ];
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        // appBar:
        // AppBar(
        //
        //   actions: <Widget>[
        //     Padding(
        //       padding: const EdgeInsets.all(3.0),
        //       child: Text(
        //         "Page: " +
        //             (_curr + 1).toString() +
        //             "/" +
        //             _list.length.toString(),
        //         textScaleFactor: 2,
        //       ),
        //     )
        //   ],
        // ),
        body: PageView(
          children: _list,
          scrollDirection: Axis.horizontal,

          // reverse: true,
          // physics: BouncingScrollPhysics(),
          controller: controller,
          onPageChanged: (num) {
            setState(() {
              _curr = num;
            });
          },
        ),
        floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                child: Text(
                  'Previous',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _list.removeAt(_curr);
                  setState(() {
                    controller.jumpToPage(_curr - 1);
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.red,
                ),
              ),

              ElevatedButton(
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    _list.add(
                      const Center(
                          child: Text("New page",
                              style: TextStyle(fontSize: 35.0))),
                    );
                  });
                  if (_curr != _list.length - 1)
                    controller.jumpToPage(_curr + 1);
                  else
                    controller.jumpToPage(0);
                },
              ),

              // FloatingActionButton(
              //     onPressed: () {
              //
              //     },
              //     child: const Icon(Icons.add)),

              // FloatingActionButton(
              //     onPressed: () {
              //       _list.removeAt(_curr);
              //       setState(() {
              //         controller.jumpToPage(_curr - 1);
              //       }
              //
              //       );
              //     },
              //     child: const Icon(Icons.delete)),
            ]));
  }
}

// class Pages extends StatelessWidget {
//   final text;
//
//   Pages({this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               text,
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//             ),
//           ]),
//     );
//   }
// }
