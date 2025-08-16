import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/auth/controler/create_account_controller.dart';
import 'package:tread256/routes/app_routes.dart';

import '../widget/create_account_text_from_field.dart';
import '../widget/profile_image_pack.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key}) {
    // Initialize controller if not already initialized
    if (!Get.isRegistered<CreateAccountController>()) {
      Get.put(CreateAccountController());
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateAccountController>();

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
                  // Profile avatar
                  ProfileImagePack(controller: controller),
                  const SizedBox(height: 16),
                  const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  CreateAccountTextFromFrield(controller: controller),
                  const SizedBox(height: 16),

                  const SizedBox(height: 16),
                  // Confirm Password
                  Obx(
                    () => TextFormField(
                      controller: controller.confirmPasswordController,
                      obscureText: controller.obscureConfirmPassword.value,
                      decoration: InputDecoration(
                        labelText: 'Confirm password',
                        hintText: 'Confirm your password',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.obscureConfirmPassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: controller.toggleConfirmPassword,
                        ),
                      ),
                      validator: controller.validateConfirmPassword,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Create Account Button
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
                      onPressed: controller.createAccount,
                      child: const Text(
                        'Create account',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Login link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Have an account? '),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoute.getLoginScreen());
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            color: Color(0xFF4CB28B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
