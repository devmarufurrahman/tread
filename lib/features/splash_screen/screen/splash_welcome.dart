import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/image_path.dart';
import 'package:tread256/routes/app_routes.dart';

class SplashWelcome extends StatelessWidget {
  const SplashWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              // Circular image
              CircleAvatar(
                radius: 90,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(ImagePath.component),
              ),
              const SizedBox(height: 40),
              // Title
              const Text(
                'Welcome to Seeds',
                style: TextStyle(
                  color: Color(0xFF5DBB9B),
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SF Pro Display',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Subtitle/description
              const Text(
                'A place for you to ideate, track, and grow your intentionality through relationships, community, and the causes you care about. Activate your influence. Reach your world!',
                style: TextStyle(
                  color: Color(0xFF4F4F4F),
                  fontSize: 16,
                  height: 1.4,
                  fontFamily: 'SF Pro Display',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 36),
              // Get Started button
              SizedBox(
                width: 150,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.getWatchYourOrchardGrow());
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF5DBB9B),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Get Started ',
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
            ],
          ),
        ),
      ),
    );
  }
}
