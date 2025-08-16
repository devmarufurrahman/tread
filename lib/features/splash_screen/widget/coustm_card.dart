import 'package:flutter/material.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/core/utils/constants/colors.dart';

class CoustmCard extends StatelessWidget {
  final String? image;
  final String? title;
  final String? description;
  const CoustmCard({super.key, this.image, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: AppColors.primaryBackground,
      child: Container(
        height: 300,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 100,
              width: 100,
              color: Colors.blue,
              child: Image.asset(
                image ?? 'assets/images/images.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title ?? "Inner Circle",

              style: getTextStyle(
                context: context,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                lineHeight: 30,
                textAlign: TextAlign.center,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description ??
                  "This tree represents your inner circle, the\n\n people closest to you, like family and\n\n friends. Add their names and track\n\n simple intentional acts of care.",
              style: getTextStyle(
                context: context,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                lineHeight: 24,
                textAlign: TextAlign.center,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
