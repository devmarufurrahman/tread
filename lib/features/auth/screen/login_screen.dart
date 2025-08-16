import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/core/utils/constants/image_path.dart';
import 'package:tread256/features/auth/controler/login_screen_controller.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';
import 'package:tread256/routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  /// LoginScreen is a StatelessWidget that represents the login screen of the application.
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: GlobalKey<FormState>(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(ImagePath.component),
                  ),
                  const SizedBox(height: 23),
                  // Welcome Text
                  const Text(
                    'WELCOME TO SEEDS ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4CB28B),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Email Field
                  TextFormField(
                    controller: controller.emailController,

                    style: const TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      labelText: 'Email Address',

                      labelStyle: const TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 15),
                  Obx(
                    () => TextFormField(
                      controller: controller.passwordController,
                      obscureText: controller.obscurePassword.value,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.obscurePassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0xFF4CB28B),
                          ),
                          onPressed: controller.togglePassword,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  // Password Fieldddd
                  const SizedBox(height: 15),
                  // Forgot Password
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.getForgotPasswordScreen());
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(color: Color(0xFF4CB28B)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  CustomButtom(
                    buttonText: "Login",
                    onPressed: () async {
                      await controller.login();
                    },
                  ),
                  const SizedBox(height: 16),
                  // Create Account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account? ',
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoute.getCreateAccountScreen());
                        },
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF4CB28B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Divider
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Or continue with'),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Social Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton(
                        Colors.white,

                        () async {
                          final userCredential =
                              await controller.signInWithGoogle();
                          if (userCredential != null) {
                            // Handle successful login, e.g., navigate to home screen
                            print('Google sign-in successful!');
                          } else {
                            print(
                              'Google sign-in was unsuccessful. Please try again.',
                            );
                          }
                        },
                        textIcon: "G",
                        isGoogle: true,
                      ),
                      // const SizedBox(width: 16),
                      // _socialButton(Colors.white, () {
                      //   // Google login logic
                      // }, icon: Icons.apple),
                      const SizedBox(width: 16),
                      _socialButton(
                        Colors.white,
                        () {
                          // Google login logic
                        },
                        textIcon: "f",
                        isGoogle: true,
                      ),
                    ],
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

  Widget _socialButton(
    Color textColor,
    VoidCallback onTap, {
    bool isGoogle = false,
    IconData? icon,
    String? textIcon,
  }) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors.primary,
        radius: 22,
        child:
            isGoogle
                ? Text(
                  textIcon ?? "",
                  style: TextStyle(color: textColor, fontSize: 20.0),
                )
                : Icon(icon, color: textColor, size: 20.0),
      ),
    );
  }
}
