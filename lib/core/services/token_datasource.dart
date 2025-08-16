import 'package:shared_preferences/shared_preferences.dart';
import 'package:tread256/core/services/shared_preference_keys.dart';

class TokenDatasource {
  static late SharedPreferences _preferences;

  /// Initialize once in main() before using
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveApiResponse(Map<String, dynamic> responseData) async {
    try {
      await _preferences.setString(
        SharedPreferenceKeys.token,
        responseData['authorization'],
      );
      await _preferences.setString(
        SharedPreferenceKeys.username,
        responseData['user']['username'],
      );
      await _preferences.setString(
        SharedPreferenceKeys.email,
        responseData['user']['email'],
      );

      return true;
    } catch (e) {
      throw Exception('Error saving API response: $e');
    }
  }

  static String? getToken() =>
      _preferences.getString(SharedPreferenceKeys.token);
  static String? getUsername() =>
      _preferences.getString(SharedPreferenceKeys.username);
  static String? getEmail() =>
      _preferences.getString(SharedPreferenceKeys.email);

  static Future<bool> delete() async {
    await _preferences.remove(SharedPreferenceKeys.token);
    await _preferences.remove(SharedPreferenceKeys.username);
    await _preferences.remove(SharedPreferenceKeys.email);

    return true;
  }
}
