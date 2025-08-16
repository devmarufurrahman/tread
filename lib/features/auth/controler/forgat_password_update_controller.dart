import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tread256/core/utils/constants/api_url.dart';
import 'dart:convert';
import 'package:tread256/features/auth/screen/login_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ForgatPasswordUpdateController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isNewPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;

  final isLoading = false.obs;

  // Toggle methods
  void toggleNewPasswordVisibility() {
    isNewPasswordHidden.value = !isNewPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  // Validate passwords
  bool validatePasswords() {
    if (newPasswordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      EasyLoading.showError('Please fill in all fields');
      return false;
    }
    if (newPasswordController.text != confirmPasswordController.text) {
      EasyLoading.showError('Passwords do not match');
      return false;
    }
    if (newPasswordController.text.length < 8) {
      EasyLoading.showError('Password must be at least 8 characters');
      return false;
    }
    return true;
  }

  // POST API call to update password
  Future<void> changePassword(String token) async {
    if (!formKey.currentState!.validate()) return;
    if (!validatePasswords()) return;

    isLoading.value = true;

    try {
      await EasyLoading.show(status: 'Updating password...');

      final response = await http.post(
        Uri.parse(ApiUrl.changePassword(token)),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'newPassword': newPasswordController.text}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        await EasyLoading.showSuccess(
          responseData['message'] ?? 'Password updated successfully',
          duration: const Duration(seconds: 3),
        );
        Get.offAll(LoginScreen());
      } else {
        final responseData = jsonDecode(response.body);
        await EasyLoading.showError(
          responseData['error'] ?? 'Failed to update password',
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      await EasyLoading.showError(
        'An error occurred: $e',
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
      await EasyLoading.dismiss();
    }
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
