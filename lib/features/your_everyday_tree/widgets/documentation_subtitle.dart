import 'package:flutter/material.dart';

Widget buildDocumentationSubtitle({required String subtitle}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        subtitle,
        style: const TextStyle(color: Colors.black54, fontSize: 15),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
