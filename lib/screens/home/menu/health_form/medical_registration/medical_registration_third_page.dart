import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rcc/screens/home/menu/health_form/medical_registration/controller/medical_controller.dart';
import 'package:rcc/widgets/custom_date_picker.dart';
import 'package:rcc/widgets/custom_file_picker.dart';
import 'package:rcc/widgets/custom_radio_group.dart';
import 'package:rcc/widgets/custom_text_field.dart';
import 'package:rcc/widgets/gradient_text.dart';

class MedicalRegistrationThirdPage extends StatelessWidget {
  MedicalRegistrationThirdPage({Key? key}) : super(key: key);

  final _bools = ["True", "False"];
  final _controller = Get.put(MedicalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 8.0,
              ),
              const GradientText(
                "ব্যক্তি, ব্যবসা এবং প্রতিষ্ঠানের তথ্য",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                color: Colors.black26,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomDatePicker(
                label: "ব্যবসা আরম্ভ করার তারিখ",
                hint: "",
                dateMask: "dd-MM-yyyy",
                onChange: (value) {
                  var parts = value!.split('-');
                  //01-01-1991 Dummy
                  final date = parts[2].trim()+"-"+parts[1].trim()+"-"+parts[0].trim();
                  _controller.medicalRegistrationDoc["business_start_date"] = date;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'প্রিমিসেস নিবন্ধিকরন ব্যবহারের উদ্দেশ্য',
                  hint: '',
                  onChange: (value) {
                    _controller.medicalRegistrationDoc["business_reg_goal"] = value;
                  }),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomRadioGroup(
                      initialValue: "পাকা/ফ্লাট",
                      items: const ["পাকা/ফ্লাট", "আধাপাকা", "কাঁচা/ফাঁকা"],
                      label: "প্রতিষ্ঠান কাঠামো",
                      onChange: (index, value) {
                        _controller.medicalRegistrationDoc["organization_structure"] = value;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomRadioGroup(
                      initialValue: "ওয়াসা",
                      items: const ["ওয়াসা", "টিউবয়েল", "সাবমার্সিবল"],
                      label: "রপানি সরবরাহের প্রকৃতি",
                      onChange: (index, value) {
                        _controller.medicalRegistrationDoc["water_supply"] = value;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomRadioGroup(
                      initialValue: "হ্যাঁ",
                      items: const [
                        "হ্যাঁ",
                        "না",
                      ],
                      label: "পর্যাপ্ত আলো-বাতাস চলাচল",
                      onChange: (index, value) {
                        _controller.medicalRegistrationDoc["light_air_circulation"] = _bools[index];
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomRadioGroup(
                      initialValue: "হ্যাঁ",
                      items: const [
                        "হ্যাঁ",
                        "না",
                      ],
                      label: "জরুরি নির্গমন ব্যবস্থা",
                      onChange: (index, value) {
                        _controller.medicalRegistrationDoc["emergency_emissions"] = _bools[index];
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'নিষ্কাশন/আবর্জনা নিয়ন্ত্রণ ব্যবস্থার সার্বিক অবস্থা',
                  hint: '',
                  onChange: (value) {
                    _controller.medicalRegistrationDoc["waste_disposal_system"] = value;
                  }),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  label: 'মন্তব্য',
                  hint: '',
                  maxLines: 5,
                  onChange: (value) {
                    _controller.medicalRegistrationDoc["comment"] = value;
                  }),
              const SizedBox(
                height: 16,
              ),
              const GradientText(
                "সংযুক্ত কাগজপত্রের তালিকা",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                color: Colors.black26,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomFilePicker(
                label: "ভাড়া/লিজ/মালিক রশিদ এর কপি",
                hint: "Choose File",
                maxFileSize: 1.5,
                allowedExtensions: const ["png", "jpg", "jpeg"],
                onChange: (File file) {
                  _controller.rentLeaseOwnerReceipt(file);
                },
                require: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomFilePicker(
                label: "পুরাতন লাইসেন্স নবায়ন এর কপি",
                hint: "Choose File",
                maxFileSize: 1.5,
                allowedExtensions: const ["png", "jpg", "jpeg"],
                onChange: (File file) {
                  _controller.registrationRenewal(file);
                },
                require: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomFilePicker(
                label: "মালিকের এনআইডি কপি",
                hint: "Choose File",
                maxFileSize: 1.5,
                allowedExtensions: const ["png", "jpg", "jpeg"],
                onChange: (File file) {
                  _controller.ownerNid(file);
                },
                require: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomFilePicker(
                label: "নাগরিকত্বের সনদ পত্রের কপি",
                hint: "Choose File",
                maxFileSize: 1.5,
                allowedExtensions: const ["png", "jpg", "jpeg"],
                onChange: (File file) {
                  _controller.citizenshipCertificate(file);
                },
                require: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomFilePicker(
                label: "পরিবেশ অধিদপ্তর কর্তৃক অনুমোদনে কপি",
                hint: "Choose File",
                maxFileSize: 1.5,
                allowedExtensions: const ["png", "jpg", "jpeg"],
                onChange: (File file) {
                  _controller.waterConnection(file);
                },
                require: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomFilePicker(
                label:
                "স্বাস্থ্য অধিদপ্তরের অনুমোদনের কপি",
                hint: "Choose File",
                maxFileSize: 1.5,
                allowedExtensions: const ["png", "jpg", "jpeg"],
                onChange: (File file) {
                  _controller.environmentApproval(file);
                },
                require: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              CustomFilePicker(
                label:
                "হাল নাগাদ হোল্ডিং কর এর ফটোকপি",
                hint: "Choose File",
                maxFileSize: 1.5,
                allowedExtensions: const ["png", "jpg", "jpeg"],
                onChange: (File file) {
                  _controller.holdingTax(file);
                },
                require: true,
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Center(
                child: Text(
                  'হলফনামা',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                'বর্ণিত তথ্যাদি সঠিক। কোন রকম সত্য গোপন করা হয় নাই বা কোন মিথ্যা তথ্য প্রদান করা হয় নাই। পরবর্তীতে কোন বিষয় বা তথ্য স্বপক্ষে মিথ্যা প্রমাণিত হইলে আমার বিরুদ্ধে প্রচলিত আইনে ব্যবস্থা গ্রহণ করা যাইবে।',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
