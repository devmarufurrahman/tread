import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/routes/app_routes.dart';

class WatchYourOrchardGrow extends StatelessWidget {
  const WatchYourOrchardGrow({super.key});

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
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 32),
              // Video preview card
              Container(
                width: 260,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFF5DBB9B),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Play button
                    Icon(
                      Icons.play_circle_fill,
                      color: Colors.white.withValues(alpha: 0.85),
                      size: 48,
                    ),
                    // Video label and title
                    Positioned(
                      left: 16,
                      top: 16,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.18),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'Step',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Watch Your Orchard Grow',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Progress bar (bottom)
                    Positioned(
                      left: 12,
                      right: 12,
                      bottom: 10,
                      child: Container(
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 60,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              // Title
              const Text(
                'Watch Your Orchard Grow',
                style: TextStyle(
                  color: Color(0xFF5DBB9B),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SF Pro Display',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              // Description
              const Text(
                'Now your trees stand tall! Track how you are reaching your Inner Circle, Everyday Circle, and Community through a full picture of everyday action.',
                style: TextStyle(
                  color: Color(0xFF4F4F4F),
                  fontSize: 15,
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
                    Get.toNamed(AppRoute.getPlantPurposeGrowImpact());
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
                        fontSize: 18,
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
    );
  }
}
