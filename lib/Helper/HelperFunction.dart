import 'package:entertainmentui/ThemeColors.dart';
import 'package:flutter/material.dart';

class HelperFunction {
  static showsSnackBar(String text, var context) {
    final snackBar = SnackBar(
      backgroundColor: ThemeColors().themeDark,
      content: Text(
        text,
        style: TextStyle(color: ThemeColors().themeRed),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
