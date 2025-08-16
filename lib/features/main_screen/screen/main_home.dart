import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/calender/screen/calendar_strip.dart';
import 'package:tread256/core/common/widgets/shimmer_loading.dart';
import '../../calender/controller/calendar_controller.dart';
import '../../perosonal_tree/screen/personal_tree_min.dart';
import '../../your_community_tree/screen/your_community_tree.dart';
import '../../your_everyday_tree/screen/your_everyday_tree.dart';
import '../controller/tree_slider_controller.dart';
import '../data/slide_data.dart' show getSlides;
import 'dart:convert';

class MainHome extends StatelessWidget {
  MainHome({super.key});

  final CalendarController calendarController = Get.put(CalendarController());
  final TreeSliderController controller = Get.put(
    TreeSliderController(getSlides()),
  );

  Widget _buildTreeImage(String imageData, String fallbackImagePath) {
    controller.loadCalendarLeaves(calendarController.getDateMonthYear(), 0);

    // Check if the image data is a URL
    if (imageData.startsWith('http://') || imageData.startsWith('https://')) {
      return Image.network(
        imageData,
        fit: BoxFit.fill,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value:
                  loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          // Fallback to asset image if network image fails
          return Image.asset(
            fallbackImagePath,
            fit: BoxFit.fill,
            errorBuilder:
                (context, error, stackTrace) =>
                    const Icon(Icons.error, size: 50),
          );
        },
      );
    } else if (imageData.startsWith('data:image/')) {
      // Handle base64 image data
      try {
        final uri = Uri.parse(imageData);
        if (uri.data != null) {
          return Image.memory(
            uri.data!.contentAsBytes(),
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                fallbackImagePath,
                fit: BoxFit.fill,
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.error, size: 50),
              );
            },
          );
        }
      } catch (e) {
        // Handle parsing error silently
      }
      // Fallback to asset image if base64 parsing fails
      return Image.asset(
        fallbackImagePath,
        fit: BoxFit.fill,
        errorBuilder:
            (context, error, stackTrace) => const Icon(Icons.error, size: 50),
      );
    } else if (imageData.isNotEmpty && imageData.length > 100) {
      // Try to treat as base64 data without data URL prefix
      try {
        final bytes = base64Decode(imageData);
        return Image.memory(
          bytes,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              fallbackImagePath,
              fit: BoxFit.fill,
              errorBuilder:
                  (context, error, stackTrace) =>
                      const Icon(Icons.error, size: 50),
            );
          },
        );
      } catch (e) {
        // Handle parsing error silently
      }
      // Fallback to asset image
      return Image.asset(
        fallbackImagePath,
        fit: BoxFit.fill,
        errorBuilder:
            (context, error, stackTrace) => const Icon(Icons.error, size: 50),
      );
    } else {
      // Use the provided asset path
      return Image.asset(
        imageData,
        fit: BoxFit.fill,
        errorBuilder:
            (context, error, stackTrace) => Image.asset(
              fallbackImagePath,
              fit: BoxFit.fill,
              errorBuilder:
                  (context, error, stackTrace) =>
                      const Icon(Icons.error, size: 50),
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print('MainHome built, resetting controllers');
    return SingleChildScrollView(
      child: Column(
        children: [
          CalendarStrip(),
          const SizedBox(height: 20),

          // Swipable PageView
          SizedBox(
            height: 400,
            child: Stack(
              children: [
                PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.slides.length,
                  onPageChanged: (index) {
                    controller.currentIndex.value = index;
                  },
                  itemBuilder: (context, index) {
                    return Obx(() {
                      final slide = controller.slides[index];

                      // Show shimmer loading for personal tree while generating
                      if (index == 0 && controller.isLoadingTreeImage.value) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: const ShimmerCard(
                                  height: 300,
                                  width: 300,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              slide.text,
                              style: const TextStyle(
                                color: Color(0xFF4CAF50),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                      }

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: _buildTreeImage(
                                slide.imagePath,
                                'assets/images/tree1.png', // Fallback for personal tree
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            slide.text,
                            style: const TextStyle(
                              color: Color(0xFF4CAF50),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    });
                  },
                ),
                const SizedBox(height: 20),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.slides.length,
                        (index) => GestureDetector(
                          onTap: () => controller.changeSlide(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width:
                                controller.currentIndex.value == index
                                    ? 20
                                    : 12,
                            height: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color:
                                  controller.currentIndex.value == index
                                      ? AppColors.primary
                                      : AppColors.sliderColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Obx(() {
            final index = controller.currentIndex.value;
            switch (index) {
              case 0:
                return PersonalTreeMin();
              case 1:
                return YourEverydayTreeScreen();
              case 2:
                return const YourCommunityTreeScreen();
              default:
                return const SizedBox.shrink();
            }
          }),

          const SizedBox(height: 20),
          // your dot indicator
        ],
      ),
    );
  }
}
