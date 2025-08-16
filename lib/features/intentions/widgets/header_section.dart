import 'package:flutter/material.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/core/utils/responsive.dart';
import 'package:tread256/features/intentions/widgets/build_image.dart';

class HeaderSection extends StatelessWidget {
  final String headerText;
  final String immagePath;
  final double? boxHeight;
  const HeaderSection({
    super.key,
    required this.headerText,
    required this.immagePath,
    this.boxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: Responsive.getResponsiveHeight(context, 80),
            width: Responsive.getResponsiveWidth(context, 80),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: BuildImage(immagePath: immagePath),
            ),
          ),
          SizedBox(
            height:
                boxHeight != null
                    ? Responsive.getResponsiveSpacing(context, boxHeight!)
                    : null,
          ),
          Text(
            headerText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: Responsive.getResponsiveFontSize(context, 22),
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
