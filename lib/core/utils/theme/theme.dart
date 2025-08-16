import 'package:flutter/material.dart';

import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getLightTheme(BuildContext context) => ThemeData(
    useMaterial3: true,
    // fontFamily: 'Poppins'
    brightness: Brightness.light,

    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.getLightTextTheme(context),
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    // appBarTheme: App_BarTheme.lightAppBarTheme,
    inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.orange,
      dialHandColor: Colors.white,
      dialTextColor: Colors.black,
      dialBackgroundColor: Colors.orange,
      hourMinuteTextColor: Colors.black,
      hourMinuteColor: Colors.orange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    datePickerTheme: DatePickerThemeData(backgroundColor: Colors.white),
    dialogTheme: DialogThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
    ),
  );

  static ThemeData getDarkTheme(BuildContext context) => ThemeData(
    useMaterial3: true,
    // fontFamily: 'Poppins'
    brightness: Brightness.dark,
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.getDarkTextTheme(context),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey[400]),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    datePickerTheme: DatePickerThemeData(backgroundColor: Colors.white),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.orange,
      dialHandColor: Colors.white,
      dialTextColor: Colors.black,
      dialBackgroundColor: Colors.orange,
      hourMinuteTextColor: Colors.black,
      hourMinuteColor: Colors.orange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
