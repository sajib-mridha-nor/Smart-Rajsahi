import 'package:flutter/material.dart';


class CustomCardText extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback? onTap;

  const CustomCardText({Key? key, required this.title, required this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 6,
      shadowColor: Colors.black38,
      margin: const EdgeInsets.all(8),
      child: SizedBox(
        child: ListTile(
          horizontalTitleGap: -4.0,
          onTap: onTap,
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
