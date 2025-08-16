import 'package:flutter/material.dart';

Widget buildDocumentationLearningsSection({required String learnings}) {
  final points =
      learnings.split('\n').where((point) => point.trim().isNotEmpty).toList();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'What Did You Learn?',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Color(0xff535A6C),
        ),
      ),
      const SizedBox(height: 10),
      if (points.isNotEmpty)
        ...points.map(
          (point) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '• ',
                  style: TextStyle(fontSize: 18, color: Color(0xff535A6C)),
                ),
                Expanded(
                  child: Text(
                    point.trim(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff535A6C),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      if (points.isEmpty)
        const Text(
          'No learnings documented yet.',
          style: TextStyle(fontSize: 14, color: Color(0xff535A6C)),
        ),
    ],
  );
}
