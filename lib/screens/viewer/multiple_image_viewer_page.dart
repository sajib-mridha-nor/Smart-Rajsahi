import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:readmore/readmore.dart';

class MultipleImageViewerPage extends StatefulWidget {
  MultipleImageViewerPage(
      {Key? key,
      this.loadingBuilder,
      this.backgroundDecoration,
      this.minScale,
      this.maxScale,
      this.initialIndex = 0,
      required this.galleryItems,
      this.scrollDirection = Axis.horizontal,
      this.descriptions})
      : pageController = PageController(initialPage: initialIndex),
        super(key: key);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<String> galleryItems;
  final Axis scrollDirection;
  final List<String>? descriptions;

  @override
  State<StatefulWidget> createState() {
    return _MultipleImageViewerPageState();
  }
}

class _MultipleImageViewerPageState extends State<MultipleImageViewerPage> {
  late int currentIndex = widget.initialIndex;
  bool isLoading = false;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: widget.descriptions != null
              ? Alignment.bottomLeft
              : Alignment.bottomRight,
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: _buildItem,
              itemCount: widget.galleryItems.length,
              loadingBuilder: widget.loadingBuilder,
              backgroundDecoration: widget.backgroundDecoration,
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: widget.descriptions != null
                      ? ReadMoreText(
                          widget.descriptions![currentIndex],
                          trimLines: 2,
                          style: const TextStyle(color: Colors.white),
                          colorClickableText: Colors.white,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          moreStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      : Container(),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "${currentIndex + 1}/${widget.galleryItems.length}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      decoration: null,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final String item = widget.galleryItems[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: CachedNetworkImageProvider(item),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 4.1,
      heroAttributes: PhotoViewHeroAttributes(tag: item),
    );
  }
}
