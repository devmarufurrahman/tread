import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:tread256/core/services/token_datasource.dart';
import 'dart:convert';
import 'package:tread256/core/utils/constants/api_url.dart';
import 'package:tread256/routes/app_routes.dart';
import '../../bottom_navbar/screen/bottom_navbar_screen.dart';
import '../../calender/controller/calendar_controller.dart';
import '../../main_screen/controller/tree_slider_controller.dart';

class LoginController extends GetxController {
  final FirebaseAuth authFirebase = FirebaseAuth.instance;
  // logincontroller update code
  final emailController = TextEditingController(
    text: "salahbdcalling1@gmail.com",
  );
  final passwordController = TextEditingController(text: "Bdcalling@22");
  var obscurePassword = true.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> login() async {
    EasyLoading.show(status: "Loading...");
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final url = Uri.parse(ApiUrl.login); // Replace with your API endpoint
      final body = jsonEncode({
        "email": emailController.text.trim(),
        "password": passwordController.text,
      });

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        await TokenDatasource.saveApiResponse(responseData);

        Get.delete<CalendarController>(force: true);
        Get.delete<TreeSliderController>(force: true);

        EasyLoading.showSuccess('Login successful');
        Get.offAll(BottomNavbarScreen());
      } else if (response.statusCode == 400) {
        final responseData = jsonDecode(response.body);
        if (responseData['message'] is List) {
          errorMessage.value = responseData['message'][0] ?? 'Bad Request';
        } else {
          errorMessage.value = responseData['message'] ?? 'Bad Request';
        }
        EasyLoading.showError(errorMessage.value);
      } else if (response.statusCode == 500) {
        final responseData = jsonDecode(response.body);
        errorMessage.value = responseData['message'] ?? 'Internal Server Error';
        EasyLoading.showError(errorMessage.value);
      } else {
        errorMessage.value = 'Invalid email or password';
        EasyLoading.showError(errorMessage.value);
      }
    } catch (e) {
      errorMessage.value = 'Something went wrong. Please try again.';
      EasyLoading.showError(errorMessage.value);
    } finally {
      isLoading.value = false;
      EasyLoading.dismiss();
    }
  }

  static Future<String> getInitialRoute() async {
    await TokenDatasource.init();
    final token = TokenDatasource.getToken();
    return token != null && token.isNotEmpty
        ? AppRoute.getBottomNavbarScreen()
        : AppRoute.getSplashScreen();
  }

  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print('Error during Google Sign-In: $e');
      return null;
    }
  }
}
