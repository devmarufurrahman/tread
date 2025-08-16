import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/routes/app_routes.dart';

import 'your_everyday_tree.dart';

class YourPersonalTree extends StatelessWidget {
  const YourPersonalTree({super.key});

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
                    'assets/images/tree2.png', // Update path if needed
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 32),
                // Title
                Text(
                  'Your Personal Tree',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF4CB08A),
                    decorationColor: const Color(0xFF4CB08A),
                    decorationThickness: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                // Description
                Text(
                  'this tree is for your friends, family,\n your people.\n\nadd their names and track intentional acts\n of love and service.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                // Dots indicator
                const SizedBox(height: 52),
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
                            index == 1
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
                      //  navigation logic
                      // Get.toNamed(AppRoute.getYourEverydayTree());
                      Get.to(YourEverydayTree());
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
