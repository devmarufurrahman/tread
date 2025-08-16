import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/main_screen/controller/tree_slider_controller.dart';

class ActionsCardSection extends StatelessWidget {
  const ActionsCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TreeSliderController>();
    final slides = controller.slides;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 190,
              width: screenWidth * 0.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Obx(
                () => Image.asset(
                  slides[controller.currentIndex.value].imagePath,
                  height: 190,
                  fit: BoxFit.contain,
                  errorBuilder:
                      (context, error, stackTrace) => const Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(width: 4.0),
            Container(
              padding: const EdgeInsets.all(10),
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Frame.png',
                    width: 50,
                    height: 50,
                    errorBuilder:
                        (context, error, stackTrace) => const Icon(Icons.error),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Actions',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    '3 Completed',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'Great job staying active!',
                    style: TextStyle(color: Colors.black38, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
