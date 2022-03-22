import 'package:flutter/material.dart';
import 'package:rcc/utils/palette.dart';

class GradientText extends StatelessWidget {
  const GradientText(
      this.text, {Key? key,
        this.style,
      }) : super(key: key);

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => const LinearGradient(colors: [
        Palette.mcgrcc, Colors.orange]).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}