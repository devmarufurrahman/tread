import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tread256/core/services/token_datasource.dart';
import 'package:tread256/core/utils/constants/api_url.dart';

import '../models/calender_model.dart';

class PersonalTreeApi {
  // Future<dynamic> fetchPersonalTreeByDate(String date) async {
  //   final token = TokenDatasource.getToken();
  //   final uri = Uri.parse('${ApiUrl.personalTreeAi}$date');
  //   List<dynamic> imageUrls;

  //   final response = await http.get(
  //     uri,
  //     headers: {'Content-Type': 'application/json', 'Authorization': '$token'},
  //   );

  //   try {
  //     if (response.statusCode == 200) {
  //       final decoded = jsonDecode(response.body);

  //       // Check if the response is directly an array of URLs
  //       if (decoded['aiTreeData'] is List) {
  //         imageUrls = decoded['aiTreeData'];

  //         final generatedTreeImage = await generateFamilyTreeImage(imageUrls);

  //         return generatedTreeImage;
  //       }

  //       // Check if the response has a data.aiImage structure

  //       final data = decoded;
  //       if (data != null && data['aiTreeData'] != null) {
  //         // Get the image URLs from the response

  //         final imageUrls = data['aiTreeData'] as List<dynamic>;

  //         // Call the family tree generator API
  //         final generatedTreeImage = await generateFamilyTreeImage(imageUrls);

  //         return generatedTreeImage;
  //       } else {
  //         EasyLoading.showError('No image URLs found in response');
  //         throw Exception('No image URLs found in response');
  //       }
  //     } else {
  //       EasyLoading.showError('Failed to load personal tree data');
  //       throw Exception('Failed to load personal tree data');
  //     }
  //   } catch (e) {
  //     EasyLoading.showError('Error loading personal tree data: $e');
  //     throw Exception('Error loading personal tree data: $e');
  //   } finally {
  //     // Dismiss loading indicator
  //     EasyLoading.dismiss();
  //   }
  // }

  // Future<dynamic> fetchEverydayTreeByDate(String date) async {
  //   final token = TokenDatasource.getToken();
  //   final uri = Uri.parse('${ApiUrl.everydayTreeAi}$date');
  //   List<dynamic> imageUrls;

  //   final response = await http.get(
  //     uri,
  //     headers: {'Content-Type': 'application/json', 'Authorization': '$token'},
  //   );
  //   try {
  //     if (response.statusCode == 200) {
  //       final decoded = jsonDecode(response.body);

  //       // Check if the response is directly an array of URLs
  //       if (decoded['aiTreeData'] is List) {
  //         imageUrls = decoded['aiTreeData'];

  //         final generatedTreeImage = await generateFamilyTreeImage(imageUrls);

  //         print('resAi: ${generatedTreeImage}');
  //         return generatedTreeImage;
  //       }

  //       // Check if the response has a data.aiImage structure

  //       final data = decoded;
  //       if (data != null && data['aiTreeData'] != null) {
  //         // Get the image URLs from the response

  //         final imageUrls = data['aiTreeData'] as List<dynamic>;

  //         // Call the family tree generator API
  //         final generatedTreeImage = await generateFamilyTreeImage(imageUrls);

  //         return generatedTreeImage;
  //       } else {
  //         EasyLoading.showError('No image URLs found in response');
  //         throw Exception('No image URLs found in response');
  //       }
  //     } else {
  //       EasyLoading.showError('Failed to load personal tree data');
  //       throw Exception('Failed to load personal tree data');
  //     }
  //   } catch (e) {
  //     EasyLoading.showError('Error loading personal tree data: $e');
  //     throw Exception('Error loading personal tree data: $e');
  //   } finally {
  //     // Dismiss loading indicator
  //     EasyLoading.dismiss();
  //   }
  // }

  // Future<String> generateFamilyTreeImage(List<dynamic> imageUrls) async {
  //   print('imgres:');
  //   try {
  //     final uri = Uri.parse(
  //       'https://family-tree-generator.onrender.com/generate-family-tree',
  //     );

  //     final requestBody = {'image_urls': imageUrls};

  //     final response = await http.post(
  //       uri,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode(requestBody),
  //     );

  //     print('imgres: ${response.body}');

  //     if (response.statusCode == 200) {
  //       // Check if response is a PNG image
  //       final contentType = response.headers['content-type'] ?? '';

  //       if (contentType.contains('image/png') ||
  //           contentType.contains('image/')) {
  //         final bytes = response.bodyBytes;
  //         final base64Image = base64Encode(bytes);
  //         final dataUrl = 'data:image/png;base64,$base64Image';

  //         return dataUrl;
  //       } else {
  //         // Try to parse as JSON first
  //         try {
  //           final decoded = jsonDecode(response.body);

  //           // Check different possible response formats
  //           if (decoded['image_url'] != null) {
  //             return decoded['image_url'].toString();
  //           } else if (decoded['data'] != null &&
  //               decoded['data']['image_url'] != null) {
  //             return decoded['data']['image_url'].toString();
  //           } else if (decoded['url'] != null) {
  //             return decoded['url'].toString();
  //           } else if (decoded['image'] != null) {
  //             return decoded['image'].toString();
  //           } else if (decoded['result'] != null) {
  //             return decoded['result'].toString();
  //           } else {
  //             // If no specific field found, return the entire response as it might be a direct URL
  //             return response.body;
  //           }
  //         } catch (e) {
  //           // If response is not JSON, it might be a direct URL or base64 image
  //           return response.body;
  //         }
  //       }
  //     } else {
  //       EasyLoading.showError(
  //         'Failed to generate family tree: ${response.statusCode}',
  //       );
  //       throw Exception(
  //         'Failed to generate family tree: ${response.statusCode}',
  //       );
  //     }
  //   } catch (e) {
  //     EasyLoading.showError('Error generating family tree: $e');
  //     throw Exception('Error generating family tree: $e');
  //   } finally {
  //     EasyLoading.dismiss();
  //   }
  // }

  Future<CalendarResponse?> fetchCalendarData(String date, String tab) async {
    String url = '${ApiUrl.baseUrl}/$tab/calendar-count-leaves?date=$date';
    String? token = TokenDatasource.getToken();
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': token!,
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return CalendarResponse.fromJson(data);
      } else {
        print('Failed to load data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
}
