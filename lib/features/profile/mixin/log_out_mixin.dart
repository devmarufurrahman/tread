import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tread256/routes/app_routes.dart' show AppRoute;

import '../../../core/services/token_datasource.dart';

mixin LogOutMixin {
  void logout() async {
    EasyLoading.show(status: "Logging out...");
    try {
      await TokenDatasource.delete();
      EasyLoading.showSuccess('Logged out');
      Get.offAllNamed(AppRoute.getLoginScreen());
    } catch (e) {
      EasyLoading.showError('Error logging out: $e');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
