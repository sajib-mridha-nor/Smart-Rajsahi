import 'package:flutter/material.dart';

import '../utils/hexcolor.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final String? error;
  final String? initialValue;
  final TextStyle? labelStyle;
  final bool? require;
  final Function onChange;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool isPasswordField;

  const CustomTextField(
      {Key? key,
      required this.label,
      this.labelStyle,
      this.require,
      required this.hint,
      this.error,
      required this.onChange,
      this.initialValue,
      this.keyboardType,
      this.maxLines = 1,
      this.isPasswordField = false})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool _passwordInVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.label +
              (widget.require == null || widget.require == true ? " *" : ""),
          style: widget.labelStyle,
        ),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          obscureText: widget.isPasswordField == true ? _passwordInVisible : false,
          decoration: InputDecoration(
              suffixIcon: widget.isPasswordField ? IconButton(
                icon: Icon(
                  _passwordInVisible ? Icons.visibility_off : Icons.visibility,
                    color: HexColor("#C4C4C4")
                ),
                onPressed: () {
                  setState(() {
                    _passwordInVisible = !_passwordInVisible; //change boolean value
                  });
                },
              ) : null,
              hintText: widget.hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#C4C4C4")),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#C4C4C4")),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 16)),
          onChanged: (value) {
            widget.onChange(value);
          },
          validator: (value) {
            if (widget.require == false) {
              return null;
            }
            if (value == null || value.isEmpty) {
              if (widget.error == null) {
                return widget.hint;
              }
              return widget.error;
            }
            return null;
          },
        )
      ],
    );
  }
}
