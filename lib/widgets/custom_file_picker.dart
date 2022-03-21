import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rcc/utils/hexcolor.dart';
import 'package:path/path.dart';
import 'package:mime/mime.dart';

class CustomFilePicker extends StatefulWidget {
  final String label;
  final TextStyle? labelStyle;
  final String hint;
  final String? error;
  final bool? require;
  final Function onChange;
  final Icon? endIcon;
  final List<String>? allowedExtensions;
  final int? maxFileSize;

  const CustomFilePicker(
      {Key? key,
      required this.label,
      required this.hint,
      this.error,
      this.require,
      required this.onChange,
      this.labelStyle,
      this.endIcon,
      this.allowedExtensions, this.maxFileSize})
      : super(key: key);

  @override
  State<CustomFilePicker> createState() => _CustomFilePickerState();
}

class _CustomFilePickerState extends State<CustomFilePicker> {
  final _inputController = TextEditingController();
  File? _selectedFile;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: widget.allowedExtensions == null ? FileType.any : FileType.custom,
        allowedExtensions: widget.allowedExtensions);

    if (result != null) {
      File file = File(result.files.single.path!);
      final int sizeInBytes = file.lengthSync();
      final double sizeInMb = sizeInBytes / (1024 * 1024);
      if (sizeInMb > (widget.maxFileSize ?? 2)) {
        Get.snackbar(
          "File is too big",
          "File size must be less than ${(widget.maxFileSize ?? 2)}MB",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
      } else {
        //set file name
        _inputController.text = basename(file.path);
        widget.onChange(file);
        setState(() {
          _selectedFile = file;
        });
      }
    } else {
      // User canceled the picker
    }
  }

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
          controller: _inputController,
          showCursor: false,
          readOnly: true,
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
          decoration: InputDecoration(
              isDense: true,
              hintText: widget.hint,
              suffixIcon: IconButton(
                  onPressed: () {
                    _pickFile();
                  },
                  icon: widget.endIcon ??
                      Icon(
                        Icons.attach_file,
                        size: 24,
                        color: HexColor("#C4C4C4"),
                      )),
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
        ),
        Container(
          child: _selectedFile != null && isImage(_selectedFile!.path) ? Container(
            height: 120,
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(6.0)),
            child: Center(
              child: Image.file(_selectedFile!) ,
            ),
          ) : null,
        )
      ],
    );
  }
}

bool isImage(String path) {
  final mimeType = lookupMimeType(path);
  return mimeType!.startsWith('image/');
}
