import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';

class NoticeDetailsPage extends StatefulWidget {
  const NoticeDetailsPage({Key? key}) : super(key: key);

  @override
  State<NoticeDetailsPage> createState() => _NoticeDetailsPageState();
}

class _NoticeDetailsPageState extends State<NoticeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text("নোটিশ", style: GoogleFonts.hindSiliguri()),
        gradient: LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")]),
      ),
    );
  }
}
