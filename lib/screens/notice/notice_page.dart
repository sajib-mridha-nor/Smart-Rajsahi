import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rcc/models/notice_response.dart';
import 'package:rcc/screens/notice/notice_details_page.dart';
import 'package:rcc/utils/constants.dart';
import 'package:rcc/utils/network/dio_client.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  final DioClient? _dioClient = DioClient(BASE_URL, Dio());
  static const _pageSize = 10;

  final PagingController<int, Notice> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final response = await _dioClient?.get("/api/v1/notice/?page=$pageKey");
      final newItems = NoticeResponse.fromJson(response).results!;
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PagedListView<int, Notice>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Notice>(
          itemBuilder: (context, item, index) {
            return InkWell(
              onTap: () {
                Get.to(const NoticeDetailsPage());
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CachedNetworkImage(
                      width: 90,
                      height: 75,
                      imageUrl:
                      'https://unsplash.com/photos/RhGK4qOwxxw/download?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjQ5NTc5MDg4&force=true&w=640',
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
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
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${item.title}",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: const <Widget>[
                            Icon(
                              Icons.date_range,
                              size: 12,
                              color: Colors.black54,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "20 আগস্ট, 2021",
                              style: TextStyle(fontSize: 11, color: Colors.black54,),
                            )
                          ],
                        )
                      ],
                    )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
