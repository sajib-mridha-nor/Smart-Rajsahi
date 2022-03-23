import 'package:flutter/material.dart';
class CustomBanner extends StatelessWidget {
  const CustomBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 120,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(13.0),
          bottomRight: Radius.circular(13.0),
        ),
        //  borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(
              'https://smartrajshahi.gov.bd/media/main-banners/RCC_BANNER_06.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
