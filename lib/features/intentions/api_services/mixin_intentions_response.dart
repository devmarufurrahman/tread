import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tread256/core/services/token_datasource.dart';
import 'package:tread256/features/intentions/models/intentions_response.dart';

mixin MixinIntentionsResponse {
  var isLoading = false.obs;

  final RxList<IntentionData> intentionData = <IntentionData>[].obs;

  final token = TokenDatasource.getToken();
  Future<void> intentions() async {
    final response = await http.get(
      Uri.parse("https://tread-test-server.onrender.com/intentions"),
      headers: {'Accept': 'application/json', 'Authorization': token ?? ""},
    );
    // EasyLoading.show(status: "Date Loading");

    try {
      if (response.statusCode == 200) {
        final responseData = IntentionsResponse.fromJson(
          jsonDecode(response.body),
        );
        // Clear the list first to prevent duplicates
        intentionData.clear();
        intentionData.addAll(responseData.data);
        // EasyLoading.dismiss();
        // EasyLoading.showSuccess("Successcully Data fatched");
      }
    } catch (e) {
      EasyLoading.showError("$e");
    }
  }
}
