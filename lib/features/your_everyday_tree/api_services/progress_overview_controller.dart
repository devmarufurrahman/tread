import 'package:get/get.dart';
import 'package:tread256/features/your_everyday_tree/api_services/everyday_tree_api.dart';
import 'package:flutter/material.dart';

class ProgressOverviewController extends GetxController {
  var data =
      <Map<String, dynamic>>[
        {'label': 'MON', 'value': 0, 'color': const Color(0xFFEABDA8)},
        {'label': 'TUE', 'value': 0, 'color': const Color(0xFFB6B7B1)},
        {'label': 'WED', 'value': 0, 'color': const Color(0xFF484C5A)},
        {'label': 'THU', 'value': 0, 'color': const Color(0xFF44A48B)},
        {'label': 'FRI', 'value': 0, 'color': const Color(0xFFB6B7B1)},
        {'label': 'SAT', 'value': 0, 'color': const Color(0xFFE05B3C)},
        {'label': 'SUN', 'value': 0, 'color': const Color(0xFF8BC34A)},
      ].obs;

  var isLoading = false.obs;
  var error = RxnString();

  @override
  void onInit() {
    super.onInit();
    fetchProgressOverviewData();
  }

  Future<void> fetchProgressOverviewData() async {
    isLoading.value = true;
    error.value = null;
    try {
      final api = EverydayTreeApi();
      final response = await api.fetchProgressOverview();
      if (response != null && response.status && response.data.isNotEmpty) {
        Map<String, int> dayValues = {};
        for (var item in response.data) {
          dayValues[item.dayLabel] = item.count;
        }
        data.value =
            data.map((item) {
              final label = item['label'];
              return {...item, 'value': dayValues[label] ?? 0};
            }).toList();
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
