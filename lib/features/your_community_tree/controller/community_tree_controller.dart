import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityTreeController extends GetxController {
  final amountController = TextEditingController();

  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }
}
