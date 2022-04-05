import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/profile/controller/profile_controller.dart';
import 'package:rcc/screens/profile/create/pages/profile_create_step_one_page.dart';
import 'package:rcc/screens/profile/create/pages/profile_create_step_three_page.dart';
import 'package:rcc/screens/profile/create/pages/profile_create_step_two_page.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/gradient_text.dart';

class ProfileCreatePage extends StatefulWidget {
  const ProfileCreatePage({Key? key}) : super(key: key);

  @override
  State<ProfileCreatePage> createState() => _ProfileCreatePageState();
}

class _ProfileCreatePageState extends State<ProfileCreatePage> {
  final _controller = Get.put(ProfileController());

  final PageController _pageController = PageController();
  final List<Widget> _screens = <Widget>[
    const ProfileCreateStepOnePage(),
    const ProfileCreateStepTwoPage(),
    const ProfileCreateStepThreePage()
  ];
  int _currentPage = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          title: const Text('প্রোফাইল সম্পূর্ণ করুন'),
          gradient:
              LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")])),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GradientText(
              "স্টেপ ${_currentPage + 1}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Expanded(
              child: Form(
            key: _formKey,
            child: PageView(
              children: _screens,
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
            ),
          )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Obx(() => Row(
                  children: <Widget>[
                    Expanded(
                        child: OutlinedButton(
                            onPressed: _currentPage == 0 ||
                                    _controller.createProfileLoading.value
                                ? null
                                : () {
                                    _pageController
                                        .jumpToPage(_currentPage - 1);
                                  },
                            child: const Padding(
                              child: Text(
                                "আগে",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              padding: EdgeInsets.all(12),
                            ))),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: CustomButton(
                      onClick: () {
                        if (_currentPage == _screens.length - 1) {
                          _controller.createProfile();
                        } else {
                          if (_formKey.currentState!.validate()) {
                            _pageController.jumpToPage(_currentPage + 1);
                          }
                        }
                      },
                      title: "পরবর্তী",
                      loading: _controller.createProfileLoading.value,
                    ))
                  ],
                )),
          ),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
