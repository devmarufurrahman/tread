import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar buildDocumentationHeader({required String title}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black),
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: const Color(0xffF2F4F5),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.teal),
          onPressed: () => Get.back(),
        ),
      ),
    ),
  );
}
