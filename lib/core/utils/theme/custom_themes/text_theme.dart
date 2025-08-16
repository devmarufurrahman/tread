import 'package:flutter/material.dart';
import 'package:tread256/core/utils/responsive.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme getLightTextTheme(BuildContext context) => TextTheme(
    displayLarge: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 57.0),
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 45.0),
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    displaySmall: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 36.0),
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    headlineLarge: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 32.0),
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 28.0),
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    headlineSmall: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 24.0),
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    titleLarge: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 22.0),
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    titleMedium: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 16.0),
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    titleSmall: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 14.0),
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    bodyLarge: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 16.0),
      fontWeight: FontWeight.normal,
      color: Colors.black87,
    ),
    bodyMedium: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 14.0),
      fontWeight: FontWeight.normal,
      color: Colors.black87,
    ),
    bodySmall: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 12.0),
      fontWeight: FontWeight.normal,
      color: Colors.black54,
    ),
    labelLarge: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 14.0),
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    labelMedium: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 12.0),
      fontWeight: FontWeight.w500,
      color: Colors.black54,
    ),
    labelSmall: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 11.0),
      fontWeight: FontWeight.w500,
      color: Colors.black45,
    ),
  );

  static TextTheme getDarkTextTheme(BuildContext context) => TextTheme(
    displayLarge: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 57.0),
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 45.0),
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    displaySmall: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 36.0),
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    headlineLarge: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 32.0),
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 28.0),
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    headlineSmall: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 24.0),
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    titleLarge: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 22.0),
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    titleMedium: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 16.0),
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    titleSmall: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 14.0),
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    bodyLarge: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 16.0),
      fontWeight: FontWeight.normal,
      color: Colors.black87,
    ),
    bodyMedium: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 14.0),
      fontWeight: FontWeight.normal,
      color: Colors.black87,
    ),
    bodySmall: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 12.0),
      fontWeight: FontWeight.normal,
      color: Colors.black54,
    ),
    labelLarge: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 14.0),
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    labelMedium: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 12.0),
      fontWeight: FontWeight.w500,
      color: Colors.black54,
    ),
    labelSmall: TextStyle(
      fontSize: Responsive.getResponsiveFontSize(context, 11.0),
      fontWeight: FontWeight.w500,
      color: Colors.black45,
    ),
  );
}
