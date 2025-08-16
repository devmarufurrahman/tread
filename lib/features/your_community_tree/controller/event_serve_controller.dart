import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../api_service/event_api.dart';
import '../models/event_model.dart';
import '../screen/opportunities_details.dart';

class EventServeController extends GetxController {
  final serveUserNameController = TextEditingController();
  final serveUserEmailController = TextEditingController();
  final serveUserPhoneController = TextEditingController();
  final selectedShift = 0.obs;

  // Regular expression for email validation
  final emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  @override
  void onInit() {
    super.onInit();
    print('EventServeController initialized');
  }

  void selectShift(int shiftIndex) {
    selectedShift.value = shiftIndex;
  }

  String getSelectedShiftTime() {
    switch (selectedShift.value) {
      case 0:
        return "Saturday, 10:00 AM - 2:00 PM (Morning Shift)";
      case 1:
        return "Saturday, 2:00 PM - 6:00 PM (Afternoon Shift)";
      default:
        return "";
    }
  }

  void signUpForServe() async {
    if (await createEvent()) {
      EasyLoading.showSuccess('Successfully signed up for serve');
      Get.to(() => OpportunitiesDetailsScreen());
    }
  }

  Future<bool> createEvent() async {
    if (serveUserNameController.text.isEmpty &&
        serveUserEmailController.text.isEmpty &&
        serveUserPhoneController.text.isEmpty) {
      EasyLoading.showError('Please fill in all required fields');
      return false;
    }

    // Validate email format
    if (!emailRegExp.hasMatch(serveUserEmailController.text)) {
      EasyLoading.showError('Please enter a valid email address');
      return false;
    }

    final event = Event(
      eventName: 'Food Drive',
      location: 'Grace Community Church',
      serveDateAndTime: getSelectedShiftTime(),
      address: '123 Main St, Springfield',
      serveUserName: serveUserNameController.text,
      serveUserEmail: serveUserEmailController.text,
      serveUserPhone: serveUserPhoneController.text,
    );

    return await EventService.postEvent(event);
  }

  @override
  void onClose() {
    serveUserNameController.dispose();
    serveUserEmailController.dispose();
    serveUserPhoneController.dispose();
    super.onClose();
  }
}
