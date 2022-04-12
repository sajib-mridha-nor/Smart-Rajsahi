import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class CustomBanner extends StatelessWidget {
  final String? url;
  const CustomBanner({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(
      height: 120,
      width: double.infinity,
      imageUrl: url ?? 'https://smartrajshahi.gov.bd/media/main-banners/RCC_BANNER_06.jpeg',
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(13.0),
            bottomRight: Radius.circular(13.0),
          ),
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
    );
  }
}
