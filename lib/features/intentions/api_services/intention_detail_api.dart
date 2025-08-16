import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:tread256/core/services/token_datasource.dart';
import 'package:tread256/features/intentions/models/intention_detail_response.dart';

mixin IntentionDetailApi {
  static Future<IntentionDetailResponse?> fetchIntentionDetail(
    String intentionId,
  ) async {
    try {
      final token = TokenDatasource.getToken();
      final response = await http.get(
        Uri.parse(
          'https://tread-test-server.onrender.com/intentions/$intentionId',
        ),
        headers: {'Accept': 'application/json', 'Authorization': token ?? ""},
      );

      print('Intention Detail API - Status: ${response.statusCode}');
      print('Intention Detail API - Response: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return IntentionDetailResponse.fromJson(jsonResponse);
      } else {
        final errorBody = jsonDecode(response.body);
        EasyLoading.showError(
          'Error: ${errorBody['message'] ?? 'Failed to fetch intention details'}',
        );
        return null;
      }
    } catch (e) {
      print('Intention Detail API - Error: $e');
      EasyLoading.showError('Network error: $e');
      return null;
    }
  }
}
