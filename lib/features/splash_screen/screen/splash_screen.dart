import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/image_path.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GetBuilder<SplashController>(
          builder:
              (controller) => CircleAvatar(
                radius: 80,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(ImagePath.component),
              ),
        ),
      ),
    );
  }
}
