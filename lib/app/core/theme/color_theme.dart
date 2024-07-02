import 'package:flutter/material.dart';

abstract class DreamColors {
  /// Main Color
  static const mainColor = Color(0xff0047FF);

  static const key = Color(0xff2787FF);

  /// Sub Color
  static const subColor = Color(0xffe2eaff);

  /// black
  static const black = Colors.black;

  /// white
  static const white = Colors.white;

  /// grey
  static const grey = Colors.grey;

  static const text1 = Color(0xff121212);
  static const text2 = Color(0xff202020);

  static const color3 = Color(0xffA6CEFF);
  static const color4 = Color(0xffF1F4FC);
  static const color5 = Color(0xff666B76);
  static const color6 = Color(0xffB6BED4);
  static const color7 = Color(0xffFF6262);
}

enum DreamColorChips {
  dream(Color(0xff0047FF), Color(0xffF1F4FC)),
  pink(Color(0xffFF5A96), Color(0xffFCF1F5)),
  green(Color(0xff5EAD7B), Color(0xffF1FCF5)),
  grey(Color(0xff898989), Color(0xffF3F3F3)),
  purple(Color(0xffC93AFF), Color(0xffF9F1FC)),
  orange(Color(0xffFF9F5A), Color(0xffFFF6F0)),
  red(Color(0xffFF4A4A), Color(0xffFCF1F1)),
  sky(Color(0xff39B8FF), Color(0xffEBF8FF));

  final Color color;
  final Color backgroundColor;

  const DreamColorChips(this.color, this.backgroundColor);
}
