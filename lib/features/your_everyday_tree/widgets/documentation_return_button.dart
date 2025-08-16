import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildDocumentationReturnButton() {
  return Center(
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2CB58D),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () => Get.back(),
        child: const Text(
          'Return to Creative Initiatives',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    ),
  );
}
