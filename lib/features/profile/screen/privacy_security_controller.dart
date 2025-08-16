import 'package:get/get.dart';

class PrivacySecurityController extends GetxController {
  // Observable variables for toggle states
  var twoFactorEnabled = false.obs;
  var biometricLoginEnabled = true.obs;
  var pushNotificationsEnabled = true.obs;
  var locationServicesEnabled = false.obs;
  var analyticsEnabled = true.obs;
  var marketingCommunicationsEnabled = false.obs;

  // Single function to update toggle states based on key
  void updateToggle(String key, bool newValue) {
    switch (key) {
      case 'twoFactor':
        twoFactorEnabled.value = newValue;
        break;
      case 'biometric':
        biometricLoginEnabled.value = newValue;
        break;
      case 'pushNotifications':
        pushNotificationsEnabled.value = newValue;
        break;
      case 'locationServices':
        locationServicesEnabled.value = newValue;
        break;
      case 'analytics':
        analyticsEnabled.value = newValue;
        break;
      case 'marketingCommunications':
        marketingCommunicationsEnabled.value = newValue;
        break;
    }
  }
}
