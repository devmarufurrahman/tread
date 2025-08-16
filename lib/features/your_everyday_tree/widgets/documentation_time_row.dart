import 'package:flutter/material.dart';

Widget buildDocumentationTimeRow({required String timeRange}) {
  return Row(
    children: [
      const Icon(Icons.access_time, color: Color(0xff535A6C), size: 20),
      const SizedBox(width: 8),
      Text(
        timeRange,
        style: const TextStyle(fontSize: 14, color: Color(0xff535A6C)),
      ),
    ],
  );
}
