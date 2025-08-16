import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tread256/core/services/token_datasource.dart';

mixin MixinUpdatenote {
  final token = TokenDatasource.getToken();
  final noteController = TextEditingController();

  Future<void> updateNote({required String id}) async {
    try {
      EasyLoading.show(status: "Saving note...");

      final response = await http.patch(
        Uri.parse(
          "https://tread-test-server.onrender.com/intentions/update-note/$id",
        ),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': token ?? "",
        },
        body: '{"note": "${noteController.text}"}',
      );

      print('Update note response status: ${response.statusCode}');
      print('Update note response body: ${response.body}');
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['status'] == true) {
          EasyLoading.showSuccess("Note saved successfully!");
        } else {
          EasyLoading.showError("Failed to save note");
        }
      } else {
        EasyLoading.showError("Failed to save note");
      }
    } catch (e) {
      EasyLoading.showError("$e");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
