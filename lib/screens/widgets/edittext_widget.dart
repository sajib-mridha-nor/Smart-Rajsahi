import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  final Function? onChange;
  final String label;
  bool? isValidatorRequire = true;

  CustomTextField(
      {Key? key, this.onChange, required this.label, this.isValidatorRequire})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              // labelText: "Email ID",
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.grey.shade400),
              hintText: 'আপনার ফোন নম্বর দিন',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(7))),
          onChanged: (value) {
            if (onChange != null) onChange!(value);
          },
          validator: (value) {
            if (isValidatorRequire != false) {
              return null;
            }
            if (value!.isEmpty) {
              return 'Password cannot be blank';
            }
            return null;
          },
        )
      ],
    );
  }
}
