import 'package:get/get.dart';
import 'package:tread256/features/auth/controler/forgot_password_controller.dart';
import 'package:tread256/features/splash_screen/controller/splash_controller.dart';
import '../../features/auth/controler/create_account_controller.dart';
import '../../features/auth/controler/forgat_password_update_controller.dart';
import '../../features/auth/controler/forgot_password_otp_controller.dart';
import '../../features/profile/controller/profile_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<CreateAccountController>(() => CreateAccountController());
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
    Get.lazyPut<ProfileAllController>(() => ProfileAllController());
    Get.lazyPut<ForgotPasswordOtpController>(
      () => ForgotPasswordOtpController(),
    );

    Get.lazyPut<ForgatPasswordUpdateController>(
      () => ForgatPasswordUpdateController(),
    );
  }
}
