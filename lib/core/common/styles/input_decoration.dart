import 'package:flutter/material.dart';

class CustomInputDecoration {
  static InputDecoration customInputDecoration({
    required String hintText,
    Color? fillColor,
    double borderRadius = 5.0,
    TextStyle hintStyle = const TextStyle(
      color: Color(0xFFADAEBC),
      fontSize: 12,
    ),
    Icon? suffixIcon,
    Widget? suffixWidget,
    bool isSuffixIcon = false,
  }) {
    return InputDecoration(
      fillColor: fillColor ?? Colors.grey[200],
      hintText: hintText,
      hintStyle: hintStyle,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide.none,
      ),
      suffixIcon: isSuffixIcon ? suffixIcon : suffixWidget,
    );
  }
}
