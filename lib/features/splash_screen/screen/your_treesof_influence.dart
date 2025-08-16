import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/routes/app_routes.dart';

class YourTreesOfInfluence extends StatelessWidget {
  const YourTreesOfInfluence({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              // Tree image
              Image.asset(
                "assets/images/tree1.png",
                height: 250,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 32),
              // Headline
              const Text(
                'Your Trees Of Influence',
                style: TextStyle(
                  color: Color(0xFF5DBB9B),
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SF Pro Display',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              // Description
              const Text(
                'Every tree starts with a seed—and your\n intentional actions make it grow.\n\nPlant with purpose and watch it thrive!',
                style: TextStyle(
                  color: Color(0xFF4F4F4F),
                  fontSize: 15,
                  fontFamily: 'SF Pro Display',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Page indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color:
                          index == 0
                              ? const Color(0xFFE28B6D)
                              : const Color(0xffF2C3AA),
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 32),
              // Next button
              SizedBox(
                width: 160,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.getYourPersonalTree());
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF5DBB9B),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'SF Pro Display',
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              // Skip button
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoute.getLoginScreen());
                },
                child: Text(
                  'Skip',
                  style: getTextStyle(
                    context: context,
                    color: Color(0xFF4F4F4F),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
