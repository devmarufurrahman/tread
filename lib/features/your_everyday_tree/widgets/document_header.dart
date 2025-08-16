import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar buildDocumentHeader({required String title}) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Color(0xffF2F4F5),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.teal),
          onPressed: () => Get.back(),
        ),
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.teal,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    ),
    centerTitle: true,
  );
}
