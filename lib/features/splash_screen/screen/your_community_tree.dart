import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/routes/app_routes.dart';

class YourCommunityTree extends StatelessWidget {
  const YourCommunityTree({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                const SizedBox(height: 32),
                // Tree image
                SizedBox(
                  height: size.height * 0.32,
                  child: Image.asset(
                    'assets/images/tree1.png', // Update this path if needed
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 32),
                // Title
                Text(
                  'Your Community Tree',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF4CB08A),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                // Description
                Text(
                  'This tree is your community canopy: churches, schools, orgs, and causes you care about.\n\nDiscover ways to serve here, make shade, and stay rooted in what matters most.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                // Dots indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color:
                            index == 3
                                ? const Color(0xFFE28B6D)
                                : const Color(0xffF2C3AA),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // Next button
                SizedBox(
                  width: 160,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.getLoginScreen());
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

                // Skip button
                TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.getLoginScreen());
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(fontSize: 16, color: Color(0xFF4CB08A)),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
