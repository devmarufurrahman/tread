import 'package:get/get.dart';
import 'package:tread256/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    // Simulate a delay, then navigate (replace with your logic)
    await Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoute.getSplashWelcomeScreen());
    });
  }
}
