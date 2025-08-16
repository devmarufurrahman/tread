import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../api_service/register_api_service.dart';

class CreateAccountController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final RegisterApiService _apiService = RegisterApiServiceImpl();

  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;
  var profileImage = Rxn<File>();
  var isLoading = false.obs;

  // Password validation methods
  bool hasUpperCase(String password) {
    return password.contains(RegExp(r'[A-Z]'));
  }

  bool hasLowerCase(String password) {
    return password.contains(RegExp(r'[a-z]'));
  }

  // bool hasSpecialChar(String password) {
  //   return password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  // }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        profileImage.value = File(image.path);
      }
    } catch (e) {
      EasyLoading.showError('Failed to pick image: $e');
    }
  }

  void showImagePickerOptions() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () {
                Get.back();
                pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Get.back();
                pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPassword() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  Future<void> createAccount() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (profileImage.value == null) {
      EasyLoading.showError('Please select a profile image');
      return;
    }

    // Additional password validation

    try {
      isLoading.value = true;

      final result = await _apiService.register(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
        address: addressController.text.trim(),
        imagePath: profileImage.value!.path,
      );

      if (result['success'] == true) {
        // Clear all input data
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        addressController.clear();
        confirmPasswordController.clear();
        profileImage.value = null;

        // Reset form
        formKey.currentState?.reset();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
