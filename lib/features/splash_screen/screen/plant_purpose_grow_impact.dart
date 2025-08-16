import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/image_path.dart';

import '../../../core/common/styles/global_text_style.dart';
import '../../../routes/app_routes.dart';

class PlantPurposeGrowImpact extends StatelessWidget {
  const PlantPurposeGrowImpact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 32),
                // Circular icon
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(ImagePath.component),
                ),
                const SizedBox(height: 36),
                // Headline
                Text(
                  'Plant purpose. Grow impact.',
                  style: getTextStyleCabinCondensed(
                    context: context,
                    color: Color(0xFF5DBB9B),
                    fontSize: 28,
                    fontWeight: FontWeight.w200,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18),
                // Description
                const Text(
                  'Track your intentionality in relationships, community, and the causes you care about—one seed at a time.',
                  style: TextStyle(
                    color: Color(0xFF4F4F4F),
                    fontSize: 14,
                    fontFamily: 'SF Pro Display',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 36),
                // Get Started button
                SizedBox(
                  width: 180,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.getYourTreesOfInfluence());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF5DBB9B),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
