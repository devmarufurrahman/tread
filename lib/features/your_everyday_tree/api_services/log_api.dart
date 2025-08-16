import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tread256/core/services/token_datasource.dart';
import 'package:tread256/core/utils/constants/api_url.dart';
import 'package:tread256/features/your_everyday_tree/controller/log_create_and_details_comtroller.dart';
import 'package:tread256/features/your_everyday_tree/models/log_create_model.dart';
import 'package:tread256/features/your_everyday_tree/screen/save_log.dart';

import '../models/log_model.dart';

LogCreateAndDetailsController controller = LogCreateAndDetailsController();

// Validate form inputs
bool validateForm() {
  // if (controller.whatDidYouDoController.text.isEmpty) {
  //   EasyLoading.showError('Please enter an activity description');
  //   return false;
  // }
  if (controller.dateController.text.isEmpty) {
    EasyLoading.showError('Please enter a date');
    return false;
  }
  // if (!RegExp(
  //   r'^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$',
  // ).hasMatch(controller.dateController.text)) {
  //   EasyLoading.showError('Please enter a valid date (YYYY-MM-DD)');
  //   return false;
  // }
  if (controller.participants.isEmpty) {
    EasyLoading.showError('Please add at least one participant');
    return false;
  }
  return true;
}

// POST API call
Future<void> submitActivity() async {
  // if (!validateForm()) return;

  controller.isLoading.value = true;

  final activity = LogCreateModel(
    whatDidYouDo: controller.whatDidYouDoController.text,
    date: controller.dateController.text,
    participants: controller.participants.toList(),
  );

  try {
    final response = await http.post(
      Uri.parse(ApiUrl.postLogCreate),
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': '${controller.token}',
      },
      body: jsonEncode(activity.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      EasyLoading.showSuccess('Log created successfully');
      // Clear form after success
      controller.whatDidYouDoController.clear();
      controller.dateController.clear();
      controller.nameController.clear();
      controller.participants.clear();
      controller.selectedUserData.value = null;
      controller.searchResults.clear();

      Get.to(() => SaveLogScreen());
    } else {
      EasyLoading.showError('Already logged for this user');
    }
  } catch (e) {
    EasyLoading.showError('An error occurred: $e');
    print('Error details: $e');
  } finally {
    controller.isLoading.value = false;
    controller.updateCanSave();
  }
}

// GET method to fetch activities
Future<List<Log>> fetchActivities() async {
  try {
    final token = TokenDatasource.getToken();
    final response = await http.get(
      Uri.parse(ApiUrl.postLogCreate),
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': token!,
      },
    );
    print('data: ${response.body}');

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final responseModel = Log.fromJson(jsonResponse);
      // Return a list containing the parsed Log object
      return [responseModel];
    } else {
      final errorBody = jsonDecode(response.body);
      EasyLoading.showError(
        '${errorBody['message'] ?? 'Failed to fetch activities: ${response.statusCode}'}',
      );
      print(
        'Error fetching activities: ${response.statusCode} - ${errorBody['message']}',
      );

      return [];
    }
  } catch (e) {
    EasyLoading.showError('Failed to fetch activities: $e');

    print('Error fetching activities: $e');
    EasyLoading.showError('An error occurred while fetching activities: $e');

    return [];
  } finally {
    EasyLoading.dismiss();
  }
}

Future<void> updateActivity(Map<String, dynamic> updateModel) async {
  controller.isLoading.value = true;

  try {
    final response = await http.patch(
      Uri.parse(ApiUrl.postLogCreate),
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': '${controller.token}',
      },
      body: jsonEncode(updateModel),
    );

    if (response.statusCode == 200 || response.statusCode == 202) {
      EasyLoading.showSuccess('Log updated successfully');
      // Clear form after success
      controller.whatDidYouDoController.clear();
      controller.dateController.clear();
      controller.nameController.clear();
      controller.participants.clear();
      controller.selectedUserData.value = null;
      controller.searchResults.clear();

      Get.to(() => SaveLogScreen());
    } else {
      EasyLoading.showError('Failed to update log');
    }
  } catch (e) {
    EasyLoading.showError('An error occurred: $e');
    print('Error details: $e');
  } finally {
    controller.isLoading.value = false;
    controller.updateCanSave();
  }
}
