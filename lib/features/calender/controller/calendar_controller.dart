import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tread256/features/your_everyday_tree/controller/your_everyday_tree_controller.dart';

class CalendarController extends GetxController {
  YourEverydayTreeController yourEverydayTreeController = Get.put(
    YourEverydayTreeController(),
  );

  var selectedMonthYear = DateTime.now().obs;
  var markedDays = <DateTime>[].obs;
  var selectedDays = <DateTime>{}.obs;
  RxString selectedAllDate = ''.obs;

  @override
  void onInit() {
    super.onInit();
    updateMarkedDays();
    yourEverydayTreeController.fetchData(getDateMonthYear());
    getDateMonthYear();
  }

  // void getAiImage() {}

  void updateMarkedDays() {
    markedDays.clear();
    final days = getDaysInWeek();
    if (days.length > 1) markedDays.add(days[1]); // 2nd day (e.g., Tue)
    if (days.length > 4) markedDays.add(days[4]); // 5th day (e.g., Sat)
    if (days.length > 5) markedDays.add(days[5]); // 6th day (e.g., Sun)
  }

  void previousMonth() {
    int newMonth = selectedMonthYear.value.month - 1;
    int newYear = selectedMonthYear.value.year;
    if (newMonth < 1) {
      newMonth = 12;
      newYear -= 1;
    }
    selectedMonthYear.value = DateTime(newYear, newMonth, 1);
    updateMarkedDays();
    yourEverydayTreeController.fetchData(getDateMonthYear());
    selectedDays.clear(); // Clear selections when month/year changes
  }

  void nextMonth() {
    int newMonth = selectedMonthYear.value.month + 1;
    int newYear = selectedMonthYear.value.year;
    if (newMonth > 12) {
      newMonth = 1;
      newYear += 1;
    }
    selectedMonthYear.value = DateTime(newYear, newMonth, 1);
    updateMarkedDays();
    yourEverydayTreeController.fetchData(getDateMonthYear());
    selectedDays.clear(); // Clear selections when month/year changes
  }

  String getMonthYear() {
    return DateFormat('MMM yyyy').format(selectedMonthYear.value).toUpperCase();
  }

  String getDateMonthYear() {
    selectedAllDate.value =
        DateFormat('yyyy-MM-dd').format(selectedMonthYear.value).toUpperCase();
    return selectedAllDate.value;
  }

  RxString get dateStream => selectedAllDate;

  List<DateTime> getDaysInWeek() {
    final year = selectedMonthYear.value.year;
    final month = selectedMonthYear.value.month;
    DateTime firstDayOfMonth = DateTime(year, month, 1);
    // Find the first Monday of the month
    int offset =
        (firstDayOfMonth.weekday == DateTime.monday)
            ? 0
            : (8 - firstDayOfMonth.weekday) % 7;
    DateTime firstMonday = firstDayOfMonth.add(Duration(days: offset));

    return List.generate(7, (index) => firstMonday.add(Duration(days: index)));
  }

  Map<int, List<DateTime>> getDaysGroupedByWeekdayInMonth() {
    final year = selectedMonthYear.value.year;
    final month = selectedMonthYear.value.month;
    final daysInMonth = DateUtils.getDaysInMonth(year, month);

    Map<int, List<DateTime>> grouped = {
      for (int i = 1; i <= 7; i++) i: [], // 1 = Monday, ..., 7 = Sunday
    };

    for (int day = 1; day <= daysInMonth; day++) {
      DateTime current = DateTime(year, month, day);
      grouped[current.weekday]?.add(current);
    }

    return grouped;
  }

  Map<int, DateTime> getSelectedDaysGroupedByWeekday() {
    Map<int, DateTime> result = {};
    for (final day in selectedDays) {
      // 1 = Mon, ..., 7 = Sun
      result[day.weekday] ??= day; // Only take the first one
    }
    return result;
  }

  bool isMarked(DateTime day) {
    return markedDays.any(
      (markedDay) =>
          markedDay.year == day.year &&
          markedDay.month == day.month &&
          markedDay.day == day.day,
    );
  }

  void toggleSelectDay(DateTime day) {
    if (selectedDays.contains(day)) {
      selectedDays.remove(day);
      print('selected day: $selectedDays');
    } else {
      selectedDays.add(day);
      print('selected day: $selectedDays');
    }
  }
}
