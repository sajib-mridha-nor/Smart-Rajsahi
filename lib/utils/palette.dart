import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor mcgrcc = MaterialColor(_mcgrccPrimaryValue, <int, Color>{
    50: Color(0xFFFFE9E8),
    100: Color(0xFFFEC7C5),
    200: Color(0xFFFEA29E),
    300: Color(0xFFFD7C77),
    400: Color(0xFFFC6059),
    500: Color(_mcgrccPrimaryValue),
    600: Color(0xFFFC3E36),
    700: Color(0xFFFB352E),
    800: Color(0xFFFB2D27),
    900: Color(0xFFFA1F1A),
  });
  static const int _mcgrccPrimaryValue = 0xFFFC443C;

  static const MaterialColor mcgrccAccent = MaterialColor(_mcgrccAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_mcgrccAccentValue),
    400: Color(0xFFFFC7C6),
    700: Color(0xFFFFAEAD),
  });
  static const int _mcgrccAccentValue = 0xFFFFF9F9;
}