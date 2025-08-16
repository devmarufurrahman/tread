import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:tread256/core/services/token_datasource.dart';
import 'package:tread256/core/utils/constants/api_url.dart';
import 'package:tread256/features/profile/api_service/profile_service.dart';

import 'package:tread256/features/profile/mixin/profile_mixin.dart';
import 'package:tread256/features/profile/models/edit_profile_model.dart';

import '../mixin/log_out_mixin.dart';
import '../models/profile_data_model.dart';

abstract class ProfileController extends GetxController
    with LogOutMixin, ProfileImageMixin {
  RxBool obscurePassword = true.obs;

  // Toggle the password visibility
  void togglePasswordVisibility();
}

class ProfileAllController extends ProfileController {
  final profileData = Rx<ProfileData?>(null);
  final editProfileData = Rx<EditProfileData?>(null);
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchProfileData();
    fetchEditProfileData();
  }

  Future<void> fetchProfileData() async {
    final data = await ProfileService.getProfileData();
    if (data != null) {
      profileData.value = data;
    } else {
      profileData.value = null;
      EasyLoading.showError('Failed to load profile data login again');
      await Future.delayed(const Duration(seconds: 1));
      logout();
    }
  }

  Future<void> fetchEditProfileData() async {
    final data = await ProfileService.getEditProfileData();
    if (data != null) {
      editProfileData.value = data;

      nameController.text = data.profile.name;
      addressController.text = data.profile.address;
      emailController.text = data.email;
    } else {
      editProfileData.value = null;
      EasyLoading.showError('Failed to load profile data');
    }
  }

  Future<void> updateProfile() async {
    if (nameController.text.isEmpty || addressController.text.isEmpty) {
      EasyLoading.showError('Name and Address are required');
      return;
    }

    EasyLoading.show(status: 'Updating profile...');
    final token = TokenDatasource.getToken();
    try {
      var request = http.MultipartRequest(
        'PATCH',
        Uri.parse(ApiUrl.profileUpdate),
      );
      // Add authorization header
      request.headers['Authorization'] = token!;
      request.headers['Content-Type'] = 'multipart/form-data';

      // Add text fields
      request.fields['name'] = nameController.text;
      request.fields['address'] = addressController.text;
      if (imageFile.value != null) {
        print('img: ${imageFile.value}');
        final mimeType =
            lookupMimeType(imageFile.value!.path) ??
            'image/png'; // Default to image/png if unknown
        print('MIME Type: $mimeType');
        request.files.add(
          await http.MultipartFile.fromPath(
            'updateImage',
            imageFile.value!.path,
            contentType: MediaType.parse(mimeType),
          ),
        );
      } else {
        print('image: ${profileData.value?.profile.image}');

        request.fields['updateImage'] = profileData.value?.profile.image ?? '';
      }

      // Send request
      var response = await request.send();
      var responseData = await http.Response.fromStream(response);

      print('res: ${responseData.body}');
      print('res: ${response.statusCode}');

      if (response.statusCode == 200) {
        fetchProfileData();
        EasyLoading.showSuccess('Profile updated successfully');
        Get.back();
      } else {
        EasyLoading.showError('Failed to update profile');
      }
    } catch (e) {
      EasyLoading.showError('An error occurred: $e');
      print('ex: $e');
    }
  }
}
