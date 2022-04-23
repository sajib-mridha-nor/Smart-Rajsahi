import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/home/menu/health_form/premises_registration/controller/premises_controller.dart';
import 'package:rcc/screens/home/menu/health_form/premises_registration/premises_registration_first_page.dart';
import 'package:rcc/screens/home/menu/health_form/premises_registration/premises_registration_second_page.dart';
import 'package:rcc/screens/home/menu/health_form/premises_registration/premises_registration_third_page.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_error.dart';

class PremisesRegistrationFormPage extends StatefulWidget {
  const PremisesRegistrationFormPage({Key? key}) : super(key: key);

  @override
  State<PremisesRegistrationFormPage> createState() =>
      _PremisesRegistrationFormPageState();
}

class _PremisesRegistrationFormPageState
    extends State<PremisesRegistrationFormPage> {
  final PageController _pageController = PageController();
  final _controller = Get.put(PremisesController());
  final _formKey = GlobalKey<FormState>();
  final _list = <Widget>[
    const PremisesRegistrationFirstPage(),
    PremisesSecondPageForm(),
    const PremisesThirdPageForm()
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          title: Text(
            "প্রিমিসেস রেজিস্ট্রেশন",
            style: GoogleFonts.hindSiliguri(),
          ),
          gradient:
              LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")])),
      body: _controller.obx((state) {
        return Column(
          children: <Widget>[
            Expanded(
                child: Form(
                    key: _formKey,
                    child: PageView(
                      children: _list,
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                    ))),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: OutlinedButton(
                          onPressed: _currentPage == 0 ||
                              _controller.submitLoading.value
                              ? null
                              : () {
                                  _pageController.jumpToPage(_currentPage - 1);
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
                      child: Obx(()=> CustomButton(
                        onClick: () {
                          if (_currentPage == _list.length - 1) {
                            _controller.submit();
                          } else {
                            if (_formKey.currentState!.validate()) {
                              _pageController.jumpToPage(_currentPage + 1);
                            }
                          }
                        },
                        title:
                        _currentPage == _list.length - 1 ? "সাবমিট" : "পরবর্তী",
                        loading: _controller.submitLoading.value,
                      )))
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            )
          ],
        );
      },
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
          onError: (msg) => CustomError(onRetry: () {
                _controller.getTemperament();
              })),
    );
  }
}
