import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tread256/features/calender/controller/calendar_controller.dart';
import 'package:tread256/features/main_screen/widgets/tree_slider.dart';
import 'package:tread256/features/perosonal_tree/api_services/personal_tree_api.dart';
import 'package:tread256/features/perosonal_tree/models/calender_model.dart';

class TreeSliderController extends GetxController {
  List<TreeSlide> slides = <TreeSlide>[].obs;
  var currentIndex = 0.obs;
  late PageController pageController;
  final CalendarController calendarController = Get.put(CalendarController());

  // Observable variable to store the generated family tree image
  var generatedTreeImage = ''.obs;
  var isLoadingTreeImage = false.obs;

  TreeSliderController(List<TreeSlide> initialSlides) {
    slides.assignAll(initialSlides);
    pageController = PageController(initialPage: 0);
  }

  void changeSlide(int index) {
    if (index != currentIndex.value) {
      currentIndex.value = index;
      pageController.jumpToPage(index);
    }
  }

  // Method to update the personal tree slide with generated image
  void updatePersonalTreeSlide(String imageUrl) {
    if (slides.isNotEmpty) {
      // Create a new slide with the generated image
      final updatedSlide = TreeSlide(imagePath: imageUrl, text: slides[0].text);
      slides[0] = updatedSlide;
      update(); // Trigger UI update
    }
  }

  // Method to update the everyday tree slide with generated image
  void updateEverydayTreeSlide(String imageUrl) {
    if (slides.isNotEmpty) {
      // Create a new slide with the generated image
      final updatedSlide = TreeSlide(imagePath: imageUrl, text: slides[1].text);
      slides[1] = updatedSlide;
      update(); // Trigger UI update
    }
  }

  void loadCalendarLeaves(String date, int tab) async {
    late final CalendarResponse? calendarResponse;
    switch (tab) {
      case 0:
        calendarController.selectedDays.clear();
        calendarResponse = await PersonalTreeApi().fetchCalendarData(
          date,
          'personal-tree',
        );
        break;
      case 1:
        calendarController.selectedDays.clear();
        calendarResponse = await PersonalTreeApi().fetchCalendarData(
          date,
          'everyday-tree',
        );
        break;
      case 2:
        calendarController.selectedDays.clear();
        break;
      default:
        null;
    }

    if (calendarResponse != null && calendarResponse.status) {
      List<DateTime> parsedDates =
          calendarResponse.calendar.map((e) => e.toLocal()).toList();

      calendarController.selectedDays
        ..clear()
        ..addAll(parsedDates);
    } else {
      print('Failed to fetch calendar data.');
    }
  }

  @override
  void onInit() {
    super.onInit();
    // ever(
    //   calendarController.selectedAllDate,
    //   (_) =>
    //       fetchAndGenerateTreeImage(calendarController.selectedAllDate.value),
    // );
    // ever(
    //   calendarController.selectedAllDate,
    //   (_) => fetchEverydayTreeImage(calendarController.selectedAllDate.value),
    // );
    ever(
      calendarController.selectedAllDate,
      (_) => loadCalendarLeaves(
        calendarController.selectedAllDate.value,
        currentIndex.value,
      ),
    );

    // fetchAndGenerateTreeImage(calendarController.getDateMonthYear());
    loadCalendarLeaves(
      calendarController.getDateMonthYear(),
      currentIndex.value,
    );

    pageController.addListener(() {
      if (pageController.page != null) {
        currentIndex.value = pageController.page!.round();
        loadCalendarLeaves(
          calendarController.getDateMonthYear(),
          currentIndex.value,
        );
      }
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
