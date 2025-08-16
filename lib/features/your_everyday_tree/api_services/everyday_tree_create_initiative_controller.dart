import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:tread256/core/services/token_datasource.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../models/everyday_tree_create_initiative_model.dart';

mixin EverydayTreeCreateInitiativeController {
  var isLoading = false.obs;
  final descriptionController = TextEditingController();
  final participantsController = TextEditingController();
  final selectedCategory = ''.obs;

  var responseModel = Rxn<CreateInitiativeResponse>();
  var errorMessage = ''.obs;

  // Initiative documentation
  var initiativeDetails = Rxn<InitiativeDocumentationResponse>();
  var isFetchingDetails = false.obs;

  Future<bool> createInitiative(CreateInitiativeRequest request) async {
    isLoading.value = true;
    errorMessage.value = '';
    final token = TokenDatasource.getToken();
    try {
      final url = Uri.parse(
        'https://tread-test-server.onrender.com/everyday-tree/create-initiative',
      );
      final res = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': token ?? '',
        },
        body: jsonEncode(request.toJson()),
      );
      if (res.statusCode == 201) {
        responseModel.value = CreateInitiativeResponse.fromJson(
          jsonDecode(res.body),
        );
        EasyLoading.showSuccess(
          responseModel.value?.message ?? 'Initiative created successfully!',
        );
        return true;
      } else {
        final errorBody = jsonDecode(res.body);
        errorMessage.value = errorBody['message'] ?? 'An error occurred';
        EasyLoading.showError(errorMessage.value);
        return false;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      EasyLoading.showError(errorMessage.value);
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> fetchInitiativeDetails(String initiativeId) async {
    isFetchingDetails.value = true;
    errorMessage.value = '';
    final token = TokenDatasource.getToken();
    try {
      final url = Uri.parse(
        'https://tread-test-server.onrender.com/everyday-tree/initative/$initiativeId',
      );
      print('🔍 GET Request URL: $url');
      print('🔍 Initiative ID: $initiativeId');

      final res = await http.get(
        url,
        headers: {'Accept': 'application/json', 'Authorization': token ?? ''},
      );

      print('🔍 GET Response Status Code: ${res.statusCode}');
      print('🔍 GET Response Body: ${res.body}');

      if (res.statusCode == 200) {
        initiativeDetails.value = InitiativeDocumentationResponse.fromJson(
          jsonDecode(res.body),
        );
        print('🔍 Parsed Response: ${initiativeDetails.value?.data}');
        return true;
      } else {
        final errorBody = jsonDecode(res.body);
        errorMessage.value =
            errorBody['message'] ?? 'Failed to fetch initiative details';
        print('GET Error Response: $errorBody');
        EasyLoading.showError(errorMessage.value);
        return false;
      }
    } catch (e) {
      print(' GET Exception: $e');
      errorMessage.value = e.toString();
      EasyLoading.showError(errorMessage.value);
      return false;
    } finally {
      isFetchingDetails.value = false;
    }
  }

  Future<void> markAsCompleted({String? initiativeId}) async {
    try {
      final token = TokenDatasource.getToken();
      final response = await http.get(
        Uri.parse(
          "https://tread-test-server.onrender.com/everyday-tree/initative/complete/$initiativeId",
        ),
        headers: {'accept': 'application/json', 'authorization': token ?? ''},
      );
      if (response.statusCode == 200) {
        EasyLoading.showSuccess("Marked Completed");
      } else {
        final errorData = jsonDecode(response.body);
        final errorMessage =
            errorData['message'] ?? 'Failed to mark initiative as completed';
        EasyLoading.showError(errorMessage);
      }
    } catch (e) {
      EasyLoading.showError(
        'An error occurred while marking initiative as completed',
      );
    } finally {
      EasyLoading.dismiss();
    }
  }

  void shareInitiative({
    required String title,
    required String description,
    required int participants,
    required String status,
    required String initiativeId,
  }) {
    // Create a comprehensive share text with all initiative details
    final shareText = '''
🌱 **$title**

📝 **Description:** $description

👥 **Participants:** $participants tagged

📊 **Status:** $status

🎯 **Initiative ID:** $initiativeId

---
Shared from Tread256 App
''';

    // Share the initiative data
    Share.share(shareText, subject: 'Check out this initiative: $title');
  }
}
