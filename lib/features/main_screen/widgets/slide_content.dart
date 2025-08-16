// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tread256/features/main_screen/controller/tree_slider_controller.dart';
// import 'package:tread256/features/perosonal_tree/screen/personal_tree_min.dart';
// import 'package:tread256/features/your_everyday_tree/screen/your_everyday_tree.dart';

// import '../../your_community_tree/screen/your_community_tree.dart';

// class SlideContent extends StatelessWidget {
//   const SlideContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<TreeSliderController>();

//     return
//      Obx(() {
//       final slide = controller.slides[controller.currentIndex.value];
//       return GestureDetector(
//         onTap: () async {
//           if (controller.currentIndex.value == 0) {
//             return await Get.to(PersonalTreeMin());
//           } else if (controller.currentIndex.value == 1) {
//             return await Get.to(YourEverydayTreeScreen());
//           } else if (controller.currentIndex.value == 2) {
//             return await Get.to(YourCommunityTreeScreen());
//           }
//         },
//         child: Column(
//           children: [
//             Image.asset(
//               slide.imagePath,
//               width: 300,
//               height: 300,
//               fit: BoxFit.contain,
//               errorBuilder:
//                   (context, error, stackTrace) => const Icon(Icons.error),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               slide.text,
//               style: const TextStyle(color: Color(0xFF4CAF50), fontSize: 20),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
