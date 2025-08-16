import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/intentions/controller/intentions_controller.dart';
import 'package:tread256/features/intentions/widgets/custom_input_decoration.dart';

Widget buildDateField(
  BuildContext context,
  AddIntentionsController controller,
) {
  Future<void> selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder:
          (context, child) => Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppColors.primary,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
            ),
            child: child!,
          ),
    );
    if (picked != null) {
      final now = DateTime.now();
      final dateTime = DateTime(
        picked.year,
        picked.month,
        picked.day,
        now.hour,
        now.minute,
        now.second,
      );
      controller.dateController.text = DateFormat(
        'yyyy-MM-ddTHH:mm:ss',
      ).format(dateTime);
    }
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Date',
        style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
      ),
      const SizedBox(height: 10),
      GestureDetector(
        onTap: selectDate,
        child: AbsorbPointer(
          child: TextField(
            controller: controller.dateController,
            decoration: customInputDecoration(
              hintText: "Date",
            ).copyWith(suffixIcon: const Icon(Icons.calendar_today)),
          ),
        ),
      ),
    ],
  );
}
