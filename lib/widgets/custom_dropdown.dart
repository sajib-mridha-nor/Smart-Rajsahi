import 'package:flutter/material.dart';
import 'package:rcc/utils/hexcolor.dart';

class CustomDropdown extends StatefulWidget {
  final String label;
  final String hint;
  final String? error;
  final String? initialValue;
  final TextStyle? labelStyle;
  final List<String> items;
  final bool? require;
  final Function(String? value) onChange;

  const CustomDropdown(
      {Key? key,
      required this.label,
      this.labelStyle,
      required this.items,
      this.require,
      required this.hint,
      this.error,
      required this.onChange,
      this.initialValue})
      : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.label + (widget.require == null || widget.require == true ? " *" : ""),
          style: widget.labelStyle,
        ),
        const SizedBox(
          height: 4,
        ),
        FormField<String>(
          builder: (FormFieldState<String> state) {
            return DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
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
                value: _currentSelectedValue ?? widget.initialValue,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: HexColor("#C4C4C4")),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: HexColor("#C4C4C4")),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 16)),
                hint: Text(
                  widget.hint,
                  style: const TextStyle(color: Colors.black54),
                ),
                isDense: true,
                onChanged: (newValue) {
                  widget.onChange(newValue);
                  setState(() {
                    _currentSelectedValue = newValue!;
                    state.didChange(newValue);
                  });
                },
                items: widget.items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            );
          },
        )
      ],
    );
  }
}
