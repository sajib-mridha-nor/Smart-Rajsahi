import 'package:flutter/material.dart';


class CustomCardText extends StatelessWidget {
  final String title;
  final String icon;

  const CustomCardText({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 10,
      margin: const EdgeInsets.all(10),
      child: SizedBox(

        child: ListTile(
          horizontalTitleGap: -4.0,
          leading: ImageIcon(
            AssetImage(icon),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

      ),
    );
  }
}
