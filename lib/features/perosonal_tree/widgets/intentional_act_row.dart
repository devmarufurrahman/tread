import 'dart:io';

import 'package:flutter/material.dart';

class IntentionalActRow extends StatelessWidget {
  final int index;
  final String title;
  final bool isCompleted;
  final String userName;
  final String userImage;

  const IntentionalActRow({
    super.key,
    required this.index,
    required this.title,
    required this.isCompleted,
    required this.userName,
    required this.userImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(userImage), radius: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(color: Colors.grey[600], fontSize: 15),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    isCompleted ? 'Completed' : 'Pending',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: isCompleted ? 25 : 25,
                  height: isCompleted ? 25 : 25,
                  child: Image.asset(
                    isCompleted
                        ? 'assets/icons/right.png'
                        : 'assets/icons/right2.png',
                    // fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
