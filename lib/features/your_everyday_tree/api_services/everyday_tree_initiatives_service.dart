import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tread256/core/services/token_datasource.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:tread256/features/your_everyday_tree/models/everyday_tree_initiatives_model.dart';
import 'package:tread256/features/your_everyday_tree/models/everyday_tree_create_initiative_model.dart';

mixin EverydayTreeInitiativesService {
  final RxList<EverydayTreeInitiative> initiatives =
      <EverydayTreeInitiative>[].obs;
  final RxBool isLoading = false.obs;

  Future<void> fetchInitiatives() async {
    try {
      isLoading.value = true;
      final token = TokenDatasource.getToken();

      if (token == null) {
        EasyLoading.showError('Authentication token not found');
        return;
      }

      final response = await http.get(
        Uri.parse(
          'https://tread-test-server.onrender.com/everyday-tree/initatives',
        ),
        headers: {'Accept': 'application/json', 'Authorization': token},
      );

      if (response.statusCode == 200) {
        final responseData = EverydayTreeInitiativesResponse.fromJson(
          json.decode(response.body),
        );
        initiatives.value = responseData.data;
        print('Fetched ${initiatives.length} initiatives');
      } else {
        EasyLoading.showError('Failed to fetch initiatives');
      }
    } catch (e) {
      print('Error fetching initiatives: $e');
      EasyLoading.showError('An error occurred while fetching initiatives');
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> saveInitiativeDocumentation(
    String initiativeId,
    InitiativeDocumentationRequest request,
  ) async {
    try {
      final token = TokenDatasource.getToken();

      final url = Uri.parse(
        'https://tread-test-server.onrender.com/everyday-tree/initative/$initiativeId',
      );

      final requestBody = jsonEncode(request.toJson());

      final res = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': token ?? '',
        },
        body: requestBody,
      );

      ;

      if (res.statusCode == 200) {
        final response = InitiativeDocumentationResponse.fromJson(
          jsonDecode(res.body),
        );
        print("The reponse is : $response");

        EasyLoading.showSuccess('Document saved successfully');

        // Refresh the initiatives list to update the UI
        await fetchInitiatives();

        return true;
      } else {
        final errorBody = jsonDecode(res.body);
        final errorMessage = errorBody['message'] ?? 'Failed to save document';

        EasyLoading.showError(errorMessage);
        return false;
      }
    } catch (e) {
      EasyLoading.showError('An error occurred while saving the document');
      return false;
    }
  }

  String getButtonText(EverydayTreeInitiative initiative) {
    if (initiative.complete) {
      return 'Completed';
    } else if (initiative.initiativeDetails != null) {
      return 'Complete';
    } else {
      return 'Log';
    }
  }

  bool isGotoThankPage(EverydayTreeInitiative initiative) {
    if (initiative.initiativeDetails != null) {
      return true;
    }
    return false;
  }

  Color getButtonColor(EverydayTreeInitiative initiative) {
    if (initiative.complete) {
      return Colors.green;
    } else if (initiative.initiativeDetails != null) {
      return Colors.blue;
    } else {
      return Colors.grey;
    }
  }

  bool isButtonEnabled(EverydayTreeInitiative initiative) {
    return !initiative.complete && initiative.initiativeDetails != null;
  }
}
