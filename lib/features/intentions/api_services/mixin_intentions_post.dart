import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tread256/core/services/token_datasource.dart';
import 'package:tread256/features/intentions/models/intentions_post.dart';

mixin MixinIntentionsPost {
  final personNameController = TextEditingController();
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final relationshipController = TextEditingController();
  final noteController = TextEditingController();
  final selectedTree = ''.obs;
  final selectedCategory = ''.obs;
  final selectedUserId = ''.obs;

  var isLoading = false.obs;

  IntentionsPost get requestBody => IntentionsPost(
    friendId:
        selectedUserId.value.isNotEmpty
            ? selectedUserId.value
            : personNameController.text,
    titleOfIntention: titleController.text,
    selectTree: selectedTree.value,
    categories: selectedCategory.value,
    date: dateController.text,
    relationship: relationshipController.text,
    note: noteController.text,
  );

  Future<void> postIntentions() async {
    final token = TokenDatasource.getToken();

    if (personNameController.text.isEmpty ||
        titleController.text.isEmpty ||
        relationshipController.text.isEmpty ||
        dateController.text.isEmpty ||
        selectedTree.value.isEmpty ||
        selectedCategory.value.isEmpty) {
      EasyLoading.showError("Please, Fill all the fields!");
      return;
    }

    try {
      isLoading.value = true;
      EasyLoading.show(status: "Saving intention...");

      final response = await http.post(
        Uri.parse("https://tread-test-server.onrender.com/intentions"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': token ?? "",
        },
        body: jsonEncode(requestBody.toJson()),
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        EasyLoading.dismiss();
        EasyLoading.showSuccess("Intention saved successfully!");
        // Clear form after success
        clearForm();
        // Navigate back after success
        Get.back();
      } else {
        final errorBody = jsonDecode(response.body);
        EasyLoading.showError(
          "Error: ${errorBody['message'] ?? 'Failed to save intention'}",
        );
      }
    } catch (e) {
      print("Error posting intention: $e");
      EasyLoading.showError("Network error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void clearForm() {
    personNameController.clear();
    titleController.clear();
    dateController.clear();
    relationshipController.clear();
    noteController.clear();
    selectedTree.value = '';
    selectedCategory.value = '';
    selectedUserId.value = '';
  }
}
