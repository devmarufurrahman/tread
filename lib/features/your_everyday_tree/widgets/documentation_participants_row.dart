import 'package:flutter/material.dart';

Widget buildDocumentationParticipantsRow({required String participants}) {
  return Row(
    children: [
      Image.asset("assets/icons/porson_icon.png", width: 20, height: 20),
      const SizedBox(width: 8),
      Expanded(
        child: Text(
          participants.isNotEmpty ? participants : 'No participants',
          style: const TextStyle(fontSize: 14, color: Color(0xff535A6C)),
        ),
      ),
    ],
  );
}
