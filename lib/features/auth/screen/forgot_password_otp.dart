import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/image_path.dart';
import 'package:tread256/features/auth/controler/forgot_password_otp_controller.dart';
import 'package:flutter/services.dart';
import 'package:tread256/routes/app_routes.dart';

class ForgotPasswordOtpScreen extends StatelessWidget {
  final String email;
  const ForgotPasswordOtpScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgotPasswordOtpController>();
    print(email);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 32),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(ImagePath.component),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF4CB28B),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'A 4-digit code was sent to\n$email',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _otpBox(controller.otp1, autoFocus: true),
                      const SizedBox(width: 8),
                      _otpBox(controller.otp2, autoFocus: true),
                      const SizedBox(width: 8),
                      _otpBox(controller.otp3, autoFocus: true),
                      const SizedBox(width: 8),
                      _otpBox(controller.otp4, autoFocus: true),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        // Get.toNamed(AppRoute.getAddOrganizationsScreen());
                        Get.toNamed(AppRoute.getForgotPasswordScreen());
                      },
                      child: Text(
                        controller.isResending.value
                            ? 'Resending...'
                            : 'Resend code',
                        style: TextStyle(
                          color: Color(0xFF4CB28B),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: const Color(0xFF4CB28B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () async {
                        // Get.toNamed(AppRoute.getLoginScreen());

                        await controller.submitOtp(email);
                      },
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _otpBox(TextEditingController controller, {bool autoFocus = false}) {
    return SizedBox(
      width: 48,
      height: 56,
      child: TextFormField(
        controller: controller,
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        maxLength: 1,
        style: const TextStyle(fontSize: 24, color: Color(0xFF4CB28B)),
        decoration: InputDecoration(
          counterText: '',
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: const BorderSide(color: Color(0xFF4CB28B)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: const BorderSide(color: Color(0xFF4CB28B), width: 2),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        },
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(Get.context!).nextFocus();
          }
        },
      ),
    );
  }
}
