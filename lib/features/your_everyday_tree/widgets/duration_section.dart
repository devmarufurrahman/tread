import 'package:flutter/material.dart';
import 'package:tread256/core/common/styles/input_decoration.dart';

Widget buildDurationSection({
  required TextEditingController startTimeController,
  required TextEditingController endTimeController,
  required BuildContext context,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Duration',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Color(0xff535A6C),
        ),
      ),
      const SizedBox(height: 8),

      // Start Time
      TextFormField(
        controller: startTimeController,
        decoration: CustomInputDecoration.customInputDecoration(
          hintText: 'Start Time',
          suffixIcon: Icon(Icons.access_time, color: Color(0xff535A6C)),
        ),
        readOnly: true,
        onTap: () async {
          final TimeOfDay? picked = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (picked != null) {
            final DateTime now = DateTime.now();
            final DateTime selectedDateTime = DateTime(
              now.year,
              now.month,
              now.day,
              picked.hour,
              picked.minute,
            );
            startTimeController.text =
                selectedDateTime.toUtc().toIso8601String();
          }
        },
      ),

      const SizedBox(height: 12),

      // End Time
      TextFormField(
        controller: endTimeController,
        decoration: CustomInputDecoration.customInputDecoration(
          hintText: 'End Time',
          suffixIcon: Icon(Icons.access_time, color: Color(0xff535A6C)),
        ),
        readOnly: true,
        onTap: () async {
          final TimeOfDay? picked = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (picked != null) {
            final DateTime now = DateTime.now();
            final DateTime selectedDateTime = DateTime(
              now.year,
              now.month,
              now.day,
              picked.hour,
              picked.minute,
            );
            endTimeController.text = selectedDateTime.toUtc().toIso8601String();
          }
        },
      ),
    ],
  );
}
