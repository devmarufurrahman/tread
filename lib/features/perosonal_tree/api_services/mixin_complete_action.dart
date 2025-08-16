import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tread256/core/services/token_datasource.dart';
import 'package:tread256/core/utils/constants/api_url.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

mixin MixinCompleteAction {
  final RxBool isCompletingAction = false.obs;

  Future<void> completeAction(String actionId) async {
    try {
      isCompletingAction.value = true;
      final token = TokenDatasource.getToken();

      if (token == null) {
        EasyLoading.showError('Authentication token not found');
        return;
      }

      final response = await http.patch(
        Uri.parse(ApiUrl.completeAction(actionId)),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': token,
        },
      );

      // print('Complete Action Response Status: ${response.statusCode}');
      // print('Complete Action Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        if (data['status'] == true) {
          EasyLoading.showSuccess('Action completed successfully!');
          // Refresh the data after completing action
          await refreshDataAfterActionComplete();
        } else {
          final errorMessage = data['message'] ?? 'Failed to complete action';
          EasyLoading.showError(errorMessage);
        }
      } else {
        final errorData = jsonDecode(response.body);
        final errorMessage =
            errorData['message'] ?? 'Failed to complete action';
        EasyLoading.showError(errorMessage);
      }
    } catch (e) {
      // print('Error completing action: $e');
      EasyLoading.showError('An error occurred while completing the action');
    } finally {
      isCompletingAction.value = false;
    }
  }

  // This method should be implemented by the controller to refresh data
  Future<void> refreshDataAfterActionComplete() async {
    // This will be overridden in the controller
  }
}
