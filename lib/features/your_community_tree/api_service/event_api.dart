import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import '../../../core/services/token_datasource.dart';
import '../../../core/utils/constants/api_url.dart';
import '../models/event_model.dart';

class EventService {
  static Future<bool> postEvent(Event event) async {
    try {
      EasyLoading.show(status: 'Creating event...');

      final token = TokenDatasource.getToken();

      final response = await http.post(
        Uri.parse(ApiUrl.postEventServe),
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'Authorization': token!,
        },
        body: jsonEncode(event.toJson()),
      );

      print('Response event: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        EasyLoading.showSuccess('Event created successfully');
        return true;
      } else {
        final errorBody = jsonDecode(response.body);
        EasyLoading.showError(
          errorBody['message'] ??
              'Failed to create event: ${response.statusCode}',
        );
        print(
          'Error creating event: ${response.statusCode} - ${errorBody['message']}',
        );
        return false;
      }
    } catch (e) {
      print('Error creating event: $e');
      EasyLoading.showError('Failed to create event: $e');
      return false;
    } finally {
      EasyLoading.dismiss();
    }
  }
}
