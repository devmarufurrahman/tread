import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tread256/core/utils/constants/api_url.dart';
import '../screen/forgot_password_update.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ForgotPasswordOtpController extends GetxController {
  final otp1 = TextEditingController();
  final otp2 = TextEditingController();
  final otp3 = TextEditingController();
  final otp4 = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final isResending = false.obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final receivedOtp = ''.obs;

  // ✅ Combine 4 digits into one integer OTP
  int getOtpAsInt() {
    final combined =
        otp1.text.trim() +
        otp2.text.trim() +
        otp3.text.trim() +
        otp4.text.trim();
    return int.tryParse(combined) ?? 0;
  }

  // ✅ Validate OTP input
  String? validateOtp(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Required';
    }
    if (!RegExp(r'^\d$').hasMatch(value.trim())) {
      return 'Invalid';
    }
    return null;
  }

  // ✅ Clear OTP fields
  void clearOtpFields() {
    otp1.clear();
    otp2.clear();
    otp3.clear();
    otp4.clear();
  }

  // ✅ Submit OTP to API with EasyLoading & Response Decode
  Future<void> submitOtp(String email) async {
    if (!formKey.currentState!.validate()) return;

    EasyLoading.show(status: 'Verifying...');
    errorMessage.value = '';

    try {
      final otpValue = getOtpAsInt();

      final response = await http.post(
        Uri.parse(ApiUrl.forgetPasswordVerify(email)),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'otp': otpValue}),
      );

      final data = jsonDecode(response.body);

      // Extract only the 'url' field
      String token = data['url']; // ✅ token string from response
      if (response.statusCode == 201) {
        EasyLoading.dismiss();
        EasyLoading.showSuccess(data['message'] ?? 'OTP verified');
        Get.to(() => ForgotPasswordUpdate(token: token));
      } else {
        EasyLoading.dismiss();
        errorMessage.value = data['message'] ?? 'Invalid OTP or server error';
        EasyLoading.showError(errorMessage.value);
      }
    } catch (e) {
      EasyLoading.dismiss();
      errorMessage.value = 'Something went wrong: $e';
      EasyLoading.showError(errorMessage.value);
    }
  }

  @override
  void onClose() {
    otp1.dispose();
    otp2.dispose();
    otp3.dispose();
    otp4.dispose();
    super.onClose();
  }
}
