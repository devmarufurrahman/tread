import 'package:flutter/material.dart';
import 'package:tread256/core/utils/constants/colors.dart';

Widget buildErrorWidget({String message = 'No intention data available!'}) {
  return Scaffold(
    body: Center(
      child: Text(
        message,
        style: TextStyle(fontSize: 20, color: AppColors.error),
      ),
    ),
  );
}
