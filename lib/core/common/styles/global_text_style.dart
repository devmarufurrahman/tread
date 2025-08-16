import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tread256/core/utils/responsive.dart';

TextStyle getTextStyle({
  required BuildContext context,
  final double fontSize = 14.0,
  final FontWeight fontWeight = FontWeight.w400,
  final double lineHeight = 21.0,
  final TextAlign textAlign = TextAlign.center,
  Color color = Colors.black,
}) {
  return GoogleFonts.nunito(
    fontSize: Responsive.getResponsiveFontSize(context, fontSize),
    fontWeight: fontWeight,
    height: Responsive.getResponsiveFontSize(context, fontSize) / lineHeight,
    color: color,
  );
}

TextStyle getTextStyleCabinCondensed({
  required BuildContext context,
  final double fontSize = 14.0,
  final FontWeight fontWeight = FontWeight.w400,
  final double lineHeight = 21.0,
  final TextAlign textAlign = TextAlign.center,
  Color color = Colors.black,
}) {
  return GoogleFonts.cabinCondensed(
    fontSize: Responsive.getResponsiveFontSize(context, fontSize),
    fontWeight: fontWeight,
    height: Responsive.getResponsiveFontSize(context, fontSize) / lineHeight,
    color: color,
  );
}
