// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rcc/screens/home/menu/health_form/premises_registration/controller/premises_controller.dart';
// import 'package:rcc/widgets/custom_dropdown.dart';
// import 'package:rcc/widgets/custom_file_picker.dart';
// import 'package:rcc/widgets/custom_text_field.dart';
// import 'package:rcc/widgets/gradient_text.dart';
// import 'dart:io';
//
// class MedicalRegFirstPage extends StatefulWidget {
//   const MedicalRegFirstPage({Key? key}) : super(key: key);
//
//   @override
//   State<MedicalRegFirstPage> createState() => _MedicalRegFirstPageState();
// }
//
// class _MedicalRegFirstPageState extends State<MedicalRegFirstPage> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Obx(()=>
// Container(
//   margin: const EdgeInsets.all(10),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       const SizedBox(
//         height: 8.0,
//       ),
//
//       const Text("রেজিস্ট্রেশান কারির নাম"),
//       Text(
//         '${_controller.profile?.name}',
//         style: const TextStyle(
//             fontWeight: FontWeight.w700,
//             fontSize: 18,
//             letterSpacing: 1.2),
//       ),
//       const SizedBox(
//         height: 8,
//       ),
//       const SizedBox(
//         height: 8,
//       ),
//       CustomTextField(
//           label: 'ব্যবসা প্রতিষ্ঠান নাম ',
//           hint: '',
//           onChange: (value) {
//             createMedicalRegFormDoc["business_name"] = value;
//           }),
//       const SizedBox(
//         height: 8,
//       ),
//       Row(
//         children: [
//           Expanded(
//             flex: 5,
//             child: CustomDropdown(
//                 label: "মিডিকালের প্রকৃতি",
//                 items: _items,
//                 hint: "-----",
//                 require: true,
//                 onChange: (String? value) {
//                   debugPrint("$value");
//                 }),
//           ),
//           const SizedBox(
//             width: 8,
//           ),
//           Expanded(
//             flex: 5,
//             child: CustomDropdown(
//                 label: "ব্যবসার ধরন",
//                 items: _items,
//                 hint: "-----",
//                 require: true,
//                 onChange: (String? value) {
//                   debugPrint("$value");
//                 }),
//           ),
//         ],
//       ),
//       const SizedBox(
//         height: 8,
//       ),
//       Row(
//         children: [
//           Expanded(
//             flex: 5,
//             child: CustomTextField(
//                 label: 'মালিকের নাম',
//                 hint: '',
//                 onChange: (value) {
//                   createMedicalRegFormDoc["owner_name"] = value;
//                 }),
//           ),
//           const SizedBox(
//             width: 8,
//           ),
//           Expanded(
//             flex: 5,
//             child: CustomFilePicker(
//               label: "আবেদনকারীর ছবি",
//               hint: "Choose File",
//               onChange: (File file) {
//                 debugPrint("${file.path}");
//               },
//               require: true,
//             ),
//           ),
//         ],
//       ),
//       const SizedBox(
//         height: 8,
//       ),
//       CustomTextField(
//           label: 'মালিকের পিতা/স্বামী/অভিবাবক এর নাম',
//           hint: '',
//           onChange: (value) {
//             createMedicalRegFormDoc["owner_father_name"] = value;
//           }),
//     ],
//   ),
//
// ),
//
//       ),
//       )
//     );
//   }
// }
