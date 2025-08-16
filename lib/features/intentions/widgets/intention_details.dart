import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/intentions/models/intention_detail_response.dart';

Widget buildIntentionOverviewCard({
  required IntentionDetailData intentionData,
}) {
  final displayDate =
      DateTime.tryParse(
        intentionData.date,
      )?.let((dt) => DateFormat('yyyy-MM-dd').format(dt)) ??
      'No Date';

  return Stack(
    children: [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color(0xFFF2F4F5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.primary.withValues(alpha: 0.3),
              child: const Icon(
                size: 40,
                Icons.phone,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              intentionData.selectTree,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              intentionData.completedAction ? 'Completed' : 'Pending',
              style: TextStyle(
                fontSize: 14,
                color:
                    intentionData.completedAction
                        ? Colors.green
                        : Colors.orange,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Call with ${intentionData.userInfo.name}',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              '${intentionData.relationship} • ${intentionData.categories} • $displayDate',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              intentionData.titleOfIntention,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      Positioned(
        right: 10,
        top: 10,
        child: Image.asset(
          'assets/icons/right.png',
          height: 30,
          width: 30,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        ),
      ),
    ],
  );
}

extension DateTimeExtension on DateTime {
  T? let<T>(T Function(DateTime) transform) => transform(this);
}
