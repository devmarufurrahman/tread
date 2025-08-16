import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tread256/features/calender/controller/calendar_controller.dart';

class CalendarStrip extends GetView<CalendarController> {
  CalendarStrip({super.key});
  @override
  final CalendarController controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          // Month and Year with Navigation Arrows
          Obx(
            () => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_left,
                      color: Colors.black54,
                      size: 40,
                    ),
                    onPressed: controller.previousMonth,
                  ),
                  Text(
                    controller.getMonthYear(),
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_right,
                      color: Colors.black54,
                      size: 40,
                    ),
                    onPressed: controller.nextMonth,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Days Row
          Obx(() {
            final Map<int, DateTime> selectedWeekdays =
                controller.getSelectedDaysGroupedByWeekday();

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(7, (index) {
                final weekday = (index % 7) + 1; // 1 = Mon, ..., 7 = Sun
                final selectedDay = selectedWeekdays[weekday];

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Weekday label (MON, TUE, ...)
                    Text(
                      DateFormat('E')
                          .format(
                            DateTime.now().subtract(
                              Duration(days: DateTime.now().weekday - weekday),
                            ),
                          )
                          .toUpperCase(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),

                    // Selected date box if it exists
                    GestureDetector(
                      onTap:
                          selectedDay != null
                              ? () => controller.toggleSelectDay(selectedDay)
                              : null,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFE0F7FA),
                          border:
                              selectedDay != null
                                  ? Border.all(color: Colors.blue, width: 2)
                                  : null,
                        ),
                        child: Center(
                          child:
                              selectedDay != null
                                  ? const Icon(
                                    Icons.eco,
                                    color: Colors.green,
                                    size: 20,
                                  )
                                  : null,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            );
          }),
        ],
      ),
    );
  }
}
