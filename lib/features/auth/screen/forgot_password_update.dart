import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/image_path.dart';
import 'package:tread256/core/common/widgets/shimmer_loading.dart';

import '../controler/forgat_password_update_controller.dart';

class ForgotPasswordUpdate extends StatelessWidget {
  final String token;
  const ForgotPasswordUpdate({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgatPasswordUpdateController>();
    debugPrint("token: $token");

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
                    radius: 48,
                    backgroundColor: const Color(0xFF4CB28B),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        ImagePath.component,
                        fit: BoxFit.contain,
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Password Update',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF4CB28B),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // New Password
                  Obx(
                    () => TextFormField(
                      controller: controller.newPasswordController,
                      obscureText: controller.isNewPasswordHidden.value,
                      decoration: InputDecoration(
                        hintText: 'New Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isNewPasswordHidden.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: controller.toggleNewPasswordVisibility,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter new password';
                        }

                        final passwordRegex = RegExp(
                          r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~^%()_+=]).{6,}$',
                        );

                        if (!passwordRegex.hasMatch(value)) {
                          return 'Password must be at least 6 characters,\ninclude 1 uppercase letter, 1 number,\nand 1 special character';
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 14),
                  Obx(
                    () => TextFormField(
                      controller: controller.confirmPasswordController,
                      obscureText: controller.isConfirmPasswordHidden.value,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isConfirmPasswordHidden.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: controller.toggleConfirmPasswordVisibility,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        } else if (value !=
                            controller.newPasswordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: Obx(
                      () => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: const Color(0xFF4CB28B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed:
                            controller.isLoading.value
                                ? null
                                : () async {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    await controller.changePassword(token);
                                  }
                                },
                        child:
                            controller.isLoading.value
                                ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: ShimmerCircle(size: 20),
                                )
                                : const Text(
                                  'Update',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
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
}
