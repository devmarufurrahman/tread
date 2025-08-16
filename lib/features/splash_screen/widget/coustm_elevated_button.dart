// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tread256/core/common/styles/global_text_style.dart';
// import 'package:tread256/core/utils/constants/colors.dart';
// import 'package:tread256/routes/app_routes.dart';

// class CoustmElevatedButton extends StatelessWidget {
//   final String? buttonName;
//   final VoidCallback? onPressed;
//   final EdgeInsetsGeometry? padding;
//   const CoustmElevatedButton({
//     super.key,
//     this.buttonName,
//     this.onPressed,
//     this.padding,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed:
//           onPressed ??
//           () {
//             Get.toNamed(AppRoute.getFillYourCanopiesScreen());
//           },
//       style: ElevatedButton.styleFrom(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)),
//         backgroundColor: AppColors.primary,
//         padding:
//             padding ?? EdgeInsets.symmetric(horizontal: 50.5, vertical: 12),
//         textStyle: const TextStyle(fontSize: 16),
//       ),
//       child: Text(
//         buttonName ?? "Get Started",
//         style: getTextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w600,
//           lineHeight: 24,
//           textAlign: TextAlign.center,
//           color: AppColors.textWhite,
//         ),
//       ),
//     );
//   }
// }
