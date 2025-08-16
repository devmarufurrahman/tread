// Concrete implementation of the RegisterApiService

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tread256/core/utils/constants/api_url.dart';

import '../../../routes/app_routes.dart';

// Abstract class defining the registration service
abstract class RegisterApiService {
  Future<Map<String, dynamic>> register({
    required String? name,
    required String? email,
    required String? password,
    required String? address,
    required String? imagePath,
  });
}

// Concrete implementation of the RegisterApiService
class RegisterApiServiceImpl implements RegisterApiService {
  static const _maxFileSize = 5 * 1024 * 1024; // 5MB
  static const _allowedExtensions = ['jpg', 'jpeg', 'png', 'webp'];

  @override
  Future<Map<String, dynamic>> register({
    required String? name,
    required String? email,
    required String? password,
    required String? address,
    required String? imagePath,
  }) async {
    try {
      // Show loading indicator
      EasyLoading.show(
        status: 'Registering...',
        maskType: EasyLoadingMaskType.black,
      );

      // Input validation
      if (name == null || name.trim().isEmpty) {
        EasyLoading.dismiss();
        return {'success': false, 'message': 'Name is required'};
      }
      if (email == null || email.trim().isEmpty) {
        EasyLoading.dismiss();
        return {'success': false, 'message': 'Email is required'};
      }
      if (password == null || password.trim().isEmpty) {
        EasyLoading.dismiss();
        return {'success': false, 'message': 'Password is required'};
      }
      if (address == null || address.trim().isEmpty) {
        EasyLoading.dismiss();
        return {'success': false, 'message': 'Address is required'};
      }
      if (imagePath == null || imagePath.trim().isEmpty) {
        EasyLoading.dismiss();
        return {'success': false, 'message': 'Please select an image'};
      }

      // Validate image file
      final file = File(imagePath);

      if (!await file.exists()) {
        EasyLoading.dismiss();
        return {
          'success': false,
          'message': 'Image file does not exist at path: $imagePath',
        };
      }

      // Check file readability
      try {
        await file.readAsBytes();
      } catch (e) {
        EasyLoading.dismiss();
        return {'success': false, 'message': 'Cannot read image file: $e'};
      }

      // Validate file size
      final fileSize = await file.length();

      if (fileSize == 0) {
        EasyLoading.dismiss();
        return {'success': false, 'message': 'Image file is empty'};
      }
      if (fileSize > _maxFileSize) {
        EasyLoading.dismiss();
        return {'success': false, 'message': 'Image size exceeds 5MB limit'};
      }

      // Validate file extension
      final extension = imagePath.split('.').last.toLowerCase();

      if (!_allowedExtensions.contains(extension)) {
        EasyLoading.dismiss();
        return {
          'success': false,
          'message': 'Invalid file type. Only JPG, PNG, and WEBP are allowed',
        };
      }

      // Create multipart request
      final request = http.MultipartRequest('POST', Uri.parse(ApiUrl.register));

      // Add form fields
      request.fields.addAll({
        'name': name.trim(),
        'email': email.trim(),
        'password': password,
        'address': address.trim(),
      });

      // Add image file
      try {
        final fileBytes = await file.readAsBytes();
        final contentType = 'image/${extension == 'jpg' ? 'jpeg' : extension}';

        final multipartFile = http.MultipartFile.fromBytes(
          'image',
          fileBytes,
          filename: 'image.$extension',
          contentType: MediaType.parse(contentType),
        );
        request.files.add(multipartFile);
      } catch (e, stackTrace) {
        EasyLoading.dismiss();
        EasyLoading.showError('Failed to process image file');
        Exception('Stack trace: $stackTrace');
        return {
          'success': false,
          'message': 'Failed to process image file: $e',
        };
      }

      final response = await request.send().timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          return http.StreamedResponse(
            Stream.value([]),
            408,
            reasonPhrase: 'Request timeout',
          );
        },
      );

      // Handle response
      final responseBody = await response.stream.bytesToString();

      try {
        final responseData = jsonDecode(responseBody);

        if (response.statusCode == 201 || response.statusCode == 200) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess('Registration Successful!');
          Get.offAllNamed(AppRoute.getLoginScreen());
          return {
            'success': true,
            'data': responseData,
            'message': 'Registration successful',
          };
        } else if (response.statusCode == 400) {
          EasyLoading.dismiss();
          String errorMessage;

          // Handle password validation error or other 400 errors
          if (responseData['message'] is List &&
              responseData['message'].isNotEmpty) {
            errorMessage = responseData['message'][0].toString();
          } else if (responseData['message'] != null) {
            errorMessage = responseData['message'].toString();
          } else {
            errorMessage =
                'Invalid input: ${responseData['error'] ?? 'Bad Request'}';
          }

          EasyLoading.showError(
            errorMessage,
            duration: const Duration(seconds: 3),
          );

          return {
            'success': false,
            'message': errorMessage,
            'statusCode': response.statusCode,
            'error': responseData,
          };
        } else if (response.statusCode == 503) {
          EasyLoading.dismiss();
          String errorMessage =
              'Service temporarily unavailable. Please try again later.';
          EasyLoading.showError(
            errorMessage,
            duration: const Duration(seconds: 3),
          );

          return {
            'success': false,
            'message': errorMessage,
            'statusCode': response.statusCode,
            'error': responseData,
          };
        } else if (responseData['error'] == 'Email already exists') {
          EasyLoading.dismiss();
          String errorMessage =
              'This email is already registered. Please use a different email.';
          EasyLoading.showError(
            errorMessage,
            duration: const Duration(seconds: 3),
          );

          return {
            'success': false,
            'message': errorMessage,
            'statusCode': response.statusCode,
            'error': responseData,
          };
        } else {
          EasyLoading.dismiss();
          String errorMessage =
              responseData['message']?.toString() ??
              'Registration failed: ${response.reasonPhrase}';
          if (responseData['error'] != null) {
            errorMessage += ' - ${responseData['error']}';
          }

          EasyLoading.showError(
            errorMessage,
            duration: const Duration(seconds: 3),
          );

          return {
            'success': false,
            'message': errorMessage,
            'statusCode': response.statusCode,
            'error': responseData,
          };
        }
      } catch (e) {
        EasyLoading.dismiss();
        String errorMessage = 'Registration failed: ${response.reasonPhrase}';
        EasyLoading.showError(
          errorMessage,
          duration: const Duration(seconds: 3),
        );

        return {
          'success': false,
          'message': errorMessage,
          'statusCode': response.statusCode,
        };
      }
    } catch (e, stackTrace) {
      EasyLoading.dismiss();
      EasyLoading.showError('Registration failed');
      Exception("$e $stackTrace");
      return {'success': false, 'message': 'Registration failed: $e'};
    }
  }
}

// Sample button implementation for registration

// {
//   "email": "text@gmail.com",
//   "password": "Textemail$222"
// }
// {
//   "email": "hassan@gmail.com",
//   "password": "Hassanemail$222"
// }
