import 'package:flutter/material.dart';

Widget buildDocumentDescription({required String description}) {
  return Column(
    children: [
      const SizedBox(height: 8),
      Text(
        description,
        style: const TextStyle(color: Colors.black54, fontSize: 15),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 24),
    ],
  );
}
