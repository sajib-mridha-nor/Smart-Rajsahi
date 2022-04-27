import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/screens/home/menu/health_form/medical_registration/controller/medical_controller.dart';
import 'package:rcc/screens/home/menu/health_form/medical_registration/medical_registration_first_page.dart';
import 'package:rcc/screens/home/menu/health_form/medical_registration/medical_registration_second_page.dart';
import 'package:rcc/screens/home/menu/health_form/medical_registration/medical_registration_third_page.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_error.dart';

class MedicalRegistrationForm extends StatefulWidget {
  const MedicalRegistrationForm({Key? key}) : super(key: key);

  @override
  State<MedicalRegistrationForm> createState() =>
      _MedicalRegistrationFormState();
}

class _MedicalRegistrationFormState extends State<MedicalRegistrationForm> {
  final _controller = Get.put(MedicalController());
  final _pageController = PageController();
  final _formKey = GlobalKey<FormState>();
  final _list = <Widget>[
    MedicalRegistrationFirstPage(),
    MedicalRegistrationSecondPage(),
    MedicalRegistrationThirdPage()
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          title: const Text('মেডিকেল নিবন্ধনকরণ'),
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
      }, onError: (msg) {
        return CustomError(onRetry: () {
          _controller.getRequireData();
        });
      }),
    );
  }
}
