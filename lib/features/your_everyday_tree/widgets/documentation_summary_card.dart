import 'package:flutter/material.dart';

Widget buildDocumentationSummaryCard({required String summary}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: const Color(0xFFF6FAF8),
      borderRadius: BorderRadius.circular(14),
    ),
    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE2F3EC),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(10),
          child: const Icon(
            Icons.lightbulb_outline,
            color: Color(0xFF2CB58D),
            size: 32,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Summary',
          style: TextStyle(
            color: Color(0xFF2CB58D),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          summary.isNotEmpty ? summary : 'No summary available',
          style: const TextStyle(color: Color(0xff535A6C), fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
