import 'package:flutter/material.dart';

InputDecoration customInputDecoration({required String hintText}) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none, // No border when not focused
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Colors.grey[300]!,
        width: 1.0,
      ), // Subtle border when focused
    ),
    fillColor: Colors.grey[100],
    filled: true,
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.grey[500], // Darker grey for better contrast
      fontSize: 16.0,
      fontStyle: FontStyle.italic, // Optional: italic style for hint
    ),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
  );
}
