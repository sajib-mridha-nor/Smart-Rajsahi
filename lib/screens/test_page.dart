import 'package:flutter/material.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:rcc/widgets/custom_dropdown.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  final _formKey = GlobalKey<FormState>();
  final _items = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello World"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomDropdown(
                  label: "আপনার জন্ম তারিখ",
                  items: _items,
                  hint: "আপনার জন্ম তারিখ দিন",
                  require: true,
                  onChange: (value) {
                    _formKey.currentState?.reset();
                    debugPrint("$value");
                  }),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  _formKey.currentState!.validate();
                }, child: const Text("Validate Form")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
