import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/models/profile_change_response.dart';
import 'package:rcc/utils/constants.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/network/dio_client.dart';
import 'package:rcc/utils/palette.dart';

class ProfileInfoChangeListPage extends StatefulWidget {
  const ProfileInfoChangeListPage({Key? key}) : super(key: key);

  @override
  State<ProfileInfoChangeListPage> createState() => _ProfileInfoChangeListPageState();
}

class _ProfileInfoChangeListPageState extends State<ProfileInfoChangeListPage> {

  static const _pageSize = 10;
  final DioClient? _dioClient = DioClient(BASE_URL, Dio());
  final PagingController<int, ProfileChange> _pagingController =
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
      final response = await _dioClient?.get("/api/v1/change-request/?page=$pageKey");
      final newItems = ProfileChangeResponse.fromJson(response).results!;
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

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text(
          "তথ্য পরিবর্তন করুন",
          style: GoogleFonts.hindSiliguri(),
        ),
        gradient: LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")]),
      ),
      body: PagedListView<int, ProfileChange>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<ProfileChange>(
          itemBuilder: (context, item, index) => Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("আপনার পরিবর্তনের কারণ বিস্তারিত লিখুন"),
                Row(
                  children: <Widget>[
                    Image.network("${item.nidFont}", width: width/3 -16,),
                    Image.network("${item.nidBack}", width: width/3-16,),
                    Image.network("${item.profilePicture}", width: width/3-16,)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
