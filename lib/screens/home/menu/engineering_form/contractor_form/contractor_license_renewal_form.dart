import 'dart:io';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/utils/palette.dart';
import 'package:rcc/widgets/custom_button.dart';
import 'package:rcc/widgets/custom_file_picker.dart';

class ContractorLicenseRenewalFormPage extends StatefulWidget {
  const ContractorLicenseRenewalFormPage({Key? key}) : super(key: key);

  @override
  State<ContractorLicenseRenewalFormPage> createState() =>
      _ContractorLicenseRenewalFormPageState();
}

class _ContractorLicenseRenewalFormPageState
    extends State<ContractorLicenseRenewalFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 3.0,
          elevation: 15.0,
          leading: const BackButton(),
          title: const Text('ঠিকাদার লাইসেন্স তালিকাভুক্তি/নবায়ন'),
          gradient:
              LinearGradient(colors: [Palette.mcgrcc, HexColor("#FB9203")])),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 8.0,
              ),
              const Center(
                child: Text(
                  "Application Submission Letter",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                indent: 39.0,
                color: Colors.black12,
                endIndent: 39.0,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: const [
                  Text("IFE NO: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("2020 - 2021"),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "\nTo:\nExecutive Engineer (Devt-2)\nRajshahi City Corporation",
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                  'I/We declare that, I have the legal capability to enter into a contract with you, and have not been declared in a eligible by the government of bangladesh on charges of engaging in corrupt, fraudulent, or collusive or coercive practices.\n\nI/We am/are not submitting more than one application in this enlistment/renewal of enlistment process in my/our own name or other name or in different names.\n\nI/We have examined and have no reservations to the Document issued by you.\n\nI/We certify that to the best of my/our knowledge, the information provided by me/us is correct and true.\n\nI/We understand that if any of the particulars and statements provided above is proven to be incorrect and/or false, my/our enlistment shall be liable to cancellation.\n\nI/We understand that you reserve the right to reject all the Applications or annul the enlistment proceedings without incurring any liability to Applicant.'),
              const SizedBox(
                height: 8.0,
              ),
              CustomFilePicker(
                label: "Attach copy of signature :",
                hint: "Browse File",
                maxFileSize: 1.5,
                allowedExtensions: const ["png", "jpg", "jpeg"],
                onChange: (File file) {
                  // _controller.registrationRenewal(file);
                },
                require: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomButton(
                onClick: () {},
                title: 'Next',
                //  loading: _controller.submitLoading.value,
              ),
            ]),
      )),
    );
  }
}
