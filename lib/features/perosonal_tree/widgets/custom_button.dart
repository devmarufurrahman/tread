import 'package:flutter/material.dart';
import 'package:tread256/core/utils/constants/colors.dart';

class CustomButtom extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  final double? vertical;
  final double? horizontal;
  final bool isPadding;

  const CustomButtom({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.vertical,
    this.isPadding = true,
    this.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide.none,
          backgroundColor: AppColors.primary,
          padding:
              isPadding
                  ? EdgeInsets.symmetric(
                    vertical: vertical ?? 15.0,
                    horizontal: horizontal ?? 50,
                  )
                  : EdgeInsets.symmetric(
                    vertical: vertical ?? 0,
                    horizontal: horizontal ?? 0,
                  ),
        ),
        child: Text(buttonText, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
