import 'package:flutter/material.dart';
import 'package:rcc/utils/palette.dart';

class CustomButton extends StatelessWidget {
  final bool loading;
  final VoidCallback onClick;
  final String title;
  const CustomButton({Key? key, this.loading = false, required this.onClick, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        primary: Colors.transparent,
        shadowColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      onPressed: loading == true ? null : onClick,
      child: Ink(
        decoration: BoxDecoration(
          gradient:
              const LinearGradient(colors: [Palette.mcgrcc, Colors.orange]),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          constraints: const BoxConstraints(minWidth: 88.0),
          child: loading == false ? Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ) : const Center(
            child: SizedBox(
                width: 26,
                height: 26,
                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5,)),
          ),
        ),
      ),
    );
  }
}
