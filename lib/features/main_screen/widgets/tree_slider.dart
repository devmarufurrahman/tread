// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tread256/features/main_screen/widgets/navigation_dots.dart';
// import 'package:tread256/features/main_screen/widgets/slide_content.dart';
// import 'package:tread256/features/perosonal_tree/screen/personal_tree_min.dart';
// import 'package:tread256/features/your_community_tree/screen/your_community_tree.dart'
//     show YourCommunityTreeScreen;
// import 'package:tread256/features/your_everyday_tree/screen/your_everyday_tree.dart';

// import '../controller/tree_slider_controller.dart';

// features/main_screen/widgets/tree_slider.dart
class TreeSlide {
  final String imagePath;
  final String text;

  TreeSlide({required this.imagePath, required this.text});
}

// class TreeSlider extends StatelessWidget {
//   final List<TreeSlide> slides;

//   TreeSlider({super.key, required this.slides});
//   final controller = Get.find<TreeSliderController>();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SlideContent(),
//             Obx(() {
//               final slide = controller.slides[controller.currentIndex.value];
//               return GestureDetector(
//                 onTap: () async {
//                   if (controller.currentIndex.value == 0) {
//                     return await Get.to(PersonalTreeMin());
//                   } else if (controller.currentIndex.value == 1) {
//                     return await Get.to(YourEverydayTreeScreen());
//                   } else if (controller.currentIndex.value == 2) {
//                     return await Get.to(YourCommunityTreeScreen());
//                   }
//                 },
//                 child: Column(
//                   children: [
//                     Image.asset(
//                       slide.imagePath,
//                       width: 300,
//                       height: 300,
//                       fit: BoxFit.contain,
//                       errorBuilder:
//                           (context, error, stackTrace) =>
//                               const Icon(Icons.error),
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       slide.text,
//                       style: const TextStyle(
//                         color: Color(0xFF4CAF50),
//                         fontSize: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }),

//             SizedBox(height: 20), NavigationDots(),
//           ],
//         ),

//         Text("page 1"),
//         Text("page 1"),
//         Text("page 1"),
//       ],
//     );
//   }
// }
