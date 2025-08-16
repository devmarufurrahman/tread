import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  // Get screen width
  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  // Get screen height
  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Get responsive width
  static double getResponsiveWidth(BuildContext context, double width) {
    // double screenWidth = getWidth(context);
    if (isMobile(context)) {
      return width * 0.8;
    } else if (isTablet(context)) {
      return width * 0.9;
    } else {
      return width;
    }
  }

  // Get responsive height
  static double getResponsiveHeight(BuildContext context, double height) {
    // double screenHeight = getHeight(context);
    if (isMobile(context)) {
      return height * 0.8;
    } else if (isTablet(context)) {
      return height * 0.9;
    } else {
      return height;
    }
  }

  // Get responsive font size
  static double getResponsiveFontSize(BuildContext context, double fontSize) {
    if (isMobile(context)) {
      return fontSize * 0.8;
    } else if (isTablet(context)) {
      return fontSize * 0.9;
    } else {
      return fontSize;
    }
  }

  // Get responsive padding
  static EdgeInsets getResponsivePadding(
    BuildContext context, {
    double horizontal = 16.0,
    double vertical = 16.0,
  }) {
    if (isMobile(context)) {
      return EdgeInsets.symmetric(
        horizontal: horizontal * 0.8,
        vertical: vertical * 0.8,
      );
    } else if (isTablet(context)) {
      return EdgeInsets.symmetric(
        horizontal: horizontal * 0.9,
        vertical: vertical * 0.9,
      );
    } else {
      return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
    }
  }

  // Get responsive margin
  static EdgeInsets getResponsiveMargin(
    BuildContext context, {
    double horizontal = 16.0,
    double vertical = 16.0,
  }) {
    if (isMobile(context)) {
      return EdgeInsets.symmetric(
        horizontal: horizontal * 0.8,
        vertical: vertical * 0.8,
      );
    } else if (isTablet(context)) {
      return EdgeInsets.symmetric(
        horizontal: horizontal * 0.9,
        vertical: vertical * 0.9,
      );
    } else {
      return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
    }
  }

  // Get responsive spacing
  static double getResponsiveSpacing(BuildContext context, double spacing) {
    if (isMobile(context)) {
      return spacing * 0.8;
    } else if (isTablet(context)) {
      return spacing * 0.9;
    } else {
      return spacing;
    }
  }
}
