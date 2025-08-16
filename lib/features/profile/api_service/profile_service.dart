import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:tread256/core/utils/constants/api_url.dart';
import 'package:tread256/features/profile/models/edit_profile_model.dart';
import '../../../core/services/token_datasource.dart';
import '../models/profile_data_model.dart';

class ProfileService {
  static Future<ProfileData?> getProfileData() async {
    try {
      final token = TokenDatasource.getToken();

      final response = await http.get(
        Uri.parse(ApiUrl.userData),
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'Authorization': token!,
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return ProfileData.fromJson(jsonResponse['data']);
      } else {
        final errorBody = jsonDecode(response.body);
        EasyLoading.showError(
          errorBody['message'] ??
              'Failed to fetch profile data: ${response.statusCode}',
        );
        print(
          'Error fetching profile data: ${response.statusCode} - ${errorBody['message']}',
        );
        return null;
      }
    } catch (e) {
      print('Error fetching profile data: $e');
      EasyLoading.showError('Failed to fetch profile data: $e');
      return null;
    } finally {
      EasyLoading.dismiss();
    }
  }

  static Future<EditProfileData?> getEditProfileData() async {
    try {
      final token = TokenDatasource.getToken();

      final response = await http.get(
        Uri.parse(ApiUrl.userEditData),
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'Authorization': token!,
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return EditProfileData.fromJson(jsonResponse['data']);
      } else {
        final errorBody = jsonDecode(response.body);
        EasyLoading.showError(
          errorBody['message'] ??
              'Failed to fetch profile data: ${response.statusCode}',
        );
        return null;
      }
    } catch (e) {
      print('Error fetching profile data: $e');
      EasyLoading.showError('Failed to fetch profile data: $e');
      return null;
    } finally {
      EasyLoading.dismiss();
    }
  }
}
