import 'package:flutter/material.dart';
import 'package:personal_web_site/core/share/color.dart';

class AppStyle {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColor.mainColor,
  );
  static ThemeData darkTheme = ThemeData.dark().copyWith();
}
