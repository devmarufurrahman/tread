import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tread256/core/services/token_datasource.dart';
import 'package:tread256/core/utils/constants/api_url.dart';
import 'package:tread256/features/perosonal_tree/api_services/mixin_fetch_profile.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

mixin MixinCreatePersolaTreeAction on MixinFetchProfile {
  final TextEditingController actionTitleController = TextEditingController();
  final TextEditingController actionDescriptionController =
      TextEditingController();
  final TextEditingController actionDateController = TextEditingController();
  final TextEditingController actionTimeController = TextEditingController();
  final RxBool isCreatingAction = false.obs;

  void clearActionForm() {
    actionTitleController.clear();
    actionDescriptionController.clear();
    actionDateController.clear();
    actionTimeController.clear();
  }

  Future<void> createPersonalTreeAction() async {
    // print('Creating action with selectedUserId: ${selectedUserId.value}');
    if (actionTitleController.text.isEmpty ||
        actionDescriptionController.text.isEmpty ||
        actionDateController.text.isEmpty ||
        actionTimeController.text.isEmpty) {
      EasyLoading.showError('Please fill all fields');
      return;
    }

    if (selectedUserId.value.isEmpty) {
      print('No user selected. selectedUserId is empty');
      EasyLoading.showError('No user selected');
      return;
    }

    try {
      isCreatingAction.value = true;
      final token = TokenDatasource.getToken();
      if (token == null) {
        EasyLoading.showError('Authentication token not found');
        return;
      }

      final requestBody = {
        'action_member': selectedUserId.value,
        'action_title': actionTitleController.text,
        'action_description': actionDescriptionController.text,
        'action_date': actionDateController.text,
        'action_time': actionTimeController.text,
      };

      print('Request Body: ${json.encode(requestBody)}');
      print('Token: $token');

      final response = await http.post(
        Uri.parse(ApiUrl.createPersonalAction),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': token,
        },
        body: json.encode(requestBody),
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      final responseJson = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        EasyLoading.showSuccess('Action created successfully');
        clearActionForm();

        // Close the bottom sheet first
        Get.back();

        // Then refresh the data after a short delay to ensure the sheet is closed
        await Future.delayed(const Duration(milliseconds: 300));
        await fetchFriendProfile(selectedUserId.value);
      } else {
        EasyLoading.showError(
          responseJson['error'] ?? 'Failed to create action',
        );
      }
    } catch (e) {
      print('Error: $e');
      EasyLoading.showError('An error occurred while creating the action');
    } finally {
      isCreatingAction.value = false;
    }
  }
}
