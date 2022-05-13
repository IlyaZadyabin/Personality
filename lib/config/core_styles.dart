import 'package:flutter/material.dart';

abstract class CoreStyles {
  static const Color black = Color(0xFF101113);
  static const Color grey = Color(0xffdadada);

  static const TextTheme textTheme = TextTheme(
    headline4: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 34, letterSpacing: 0.25),
    headline3: TextStyle(
        fontWeight: FontWeight.w400, fontSize: 30, letterSpacing: 1.25),
    button: TextStyle(
        fontWeight: FontWeight.w600, fontSize: 18, letterSpacing: 1.25),
    subtitle1: TextStyle(
        fontWeight: FontWeight.normal, fontSize: 20, letterSpacing: 0.15),
    subtitle2: TextStyle(
        fontWeight: FontWeight.w500, fontSize: 22, letterSpacing: 0.1),
    bodyText1: TextStyle(
        fontWeight: FontWeight.w500, fontSize: 18, letterSpacing: 0.1),
    bodyText2: TextStyle(
        fontWeight: FontWeight.normal, fontSize: 14, letterSpacing: 0.25),
    caption: TextStyle(
        fontWeight: FontWeight.w600, fontSize: 12, letterSpacing: 0.25),
  );
}
