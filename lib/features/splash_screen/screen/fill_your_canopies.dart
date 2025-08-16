import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/routes/app_routes.dart';

class FillYourCanopiesScreen extends StatelessWidget {
  const FillYourCanopiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 26),
              // Title
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  'Fill Your Canopies',
                  style: TextStyle(
                    color: Color(0xFF5DBB9B),
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'SF Pro Display',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 4),
              // Subtitle
              const Text(
                'Three trees. Three opportunities to reach\n your world.',
                style: TextStyle(
                  color: Color(0xFF4F4F4F),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              // Card 1
              _TreeCard(
                imagePath: 'assets/images/objects2.png',
                title: 'Your Personal Tree',
                titleColor: Color(0xFF5DBB9B),
                description:
                    'This tree represents your inner circle: the people closest to you, like family and friends. Add their names and track simple, intentional acts of care.',
              ),
              const SizedBox(height: 10),
              // Card 2
              _TreeCard(
                imagePath: 'assets/images/objects1.png',
                title: 'Your Everyday Tree',
                titleColor: Color(0xFF5DBB9B),
                description:
                    'This tree is for your everyday circle: neighbors, coworkers, friend groups. Log creative initiatives like meal trains, tip nights, or group service projects.',
              ),
              const SizedBox(height: 10),
              // Card 3
              _TreeCard(
                imagePath: 'assets/images/objects1.png',
                title: 'Your Community Tree',
                titleColor: Color(0xFF5DBB9B),
                description:
                    'This tree represents your wider community: churches, nonprofits, and causes you want to support. Discover opportunities to give, serve, and stay connected to what matters.',
              ),
              const SizedBox(height: 20),
              // Next button
              SizedBox(
                width: 120,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.getWatchYourOrchardGrow());
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
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
              const SizedBox(height: 26),
            ],
          ),
        ),
      ),
    );
  }
}

class _TreeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final Color titleColor;
  final String description;

  const _TreeCard({
    required this.imagePath,
    required this.title,
    required this.titleColor,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFFE0E0E0), width: 0.3),
      ),
      child: Column(
        children: [
          Image.asset(imagePath, height: 54, fit: BoxFit.contain),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontSize: 26,
              fontWeight: FontWeight.w700,
              fontFamily: 'SF Pro Display',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(
              color: Color(0xFF4F4F4F),
              fontSize: 16,
              fontFamily: 'SF Pro Display',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
