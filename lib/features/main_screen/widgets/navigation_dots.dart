// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tread256/features/main_screen/controller/tree_slider_controller.dart';

// class NavigationDots extends StatelessWidget {
//   const NavigationDots({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<TreeSliderController>();

//     return

//     Obx(
//       () => Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: List.generate(
//           controller.slides.length,
//           (index) => GestureDetector(
//             onTap: () => controller.changeSlide(index),
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 5),
//               width: 15,
//               height: 15,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color:
//                     controller.currentIndex.value == index
//                         ? Colors.red
//                         : const Color(0xFFF2C3AA),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
