import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tread256/core/services/token_datasource.dart';
import 'package:tread256/features/your_everyday_tree/models/initiative_details_model.dart';

class InitiativeDetailsService {
  static Future<InitiativeDetailsResponse> getInitiativeDetails(
    String initiativeId,
  ) async {
    try {
      final token = TokenDatasource.getToken();
      final response = await http.get(
        Uri.parse(
          "https://tread-test-server.onrender.com/everyday-tree/initative/$initiativeId",
        ),
        headers: {'accept': 'application/json', 'authorization': token ?? ''},
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return InitiativeDetailsResponse.fromJson(responseData);
      } else {
        final errorData = jsonDecode(response.body);
        final errorMessage =
            errorData['message'] ?? 'Failed to load initiative details';
        throw Exception(errorMessage);
      }
    } catch (e) {
      throw Exception('An error occurred while loading initiative details: $e');
    }
  }
}
