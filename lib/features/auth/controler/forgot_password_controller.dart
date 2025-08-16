import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tread256/core/models/response_data.dart';
import 'package:tread256/core/utils/constants/api_url.dart';
import '../../../core/services/network_caller.dart';
import 'dart:developer' as developer show log;

import '../screen/forgot_password_otp.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final isLoading = false.obs;

  Future<void> sendCode() async {
    if (!formKey.currentState!.validate()) return;

    try {
      await EasyLoading.show(status: "Loading...");
      isLoading.value = true;

      final String email = emailController.text.trim();
      final String url = ApiUrl.forgetPassword(email);

      developer.log('Calling API: $url');

      final ResponseData response = await NetworkCaller()
          .getRequest(url)
          .timeout(
            Duration(seconds: 30),
            onTimeout: () {
              throw Exception('Request timed out. Please try again.');
            },
          );
      print(response);
      if (response.statusCode == 200) {
        await EasyLoading.showSuccess(
          'A reset code has been sent to your email.',
        );
        // Optionally navigate to verification screen
        // Get.toNamed(Routes.verifyCode, arguments: email);

        Get.to(ForgotPasswordOtpScreen(email: email)); // Direct navigation
      } else {
        String errorMessage = 'Failed to send reset code.';
        if (response.statusCode == 403) {
          final responseData = response.responseData;
          if (responseData is Map<String, dynamic> &&
              responseData['message'] != null) {
            errorMessage =
                responseData['message']; // e.g., "Your email is invalid! Please try again with a valid email"
          } else {
            errorMessage = 'Invalid email provided.';
          }
        } else if (response.errorMessage.isNotEmpty) {
          errorMessage = response.errorMessage;
        }

        throw Exception(errorMessage);
      }
    } catch (e) {
      final errorMessage = e.toString().replaceFirst('Exception: ', '');
      await EasyLoading.showError(
        errorMessage,
        duration: Duration(seconds: 10),
      ); // Show error message
      developer.log('Error sending reset code: $e', error: e);
    } finally {
      isLoading.value = false;
      await EasyLoading.dismiss(); // Dismiss loading
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
