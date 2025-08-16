import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/intentions/api_services/intention_detail_api.dart';
import 'package:tread256/features/intentions/models/intention_detail_response.dart';
import 'package:tread256/features/intentions/models/intentions_response.dart';

mixin MixinIntentionDetail {
  final intentionDetailData = Rx<IntentionDetailData?>(null);
  final isLoading = true.obs;
  final noteController = TextEditingController();

  Future<void> fetchIntentionDetail() async {
    // Get the intention ID from arguments
    final intention = Get.arguments as dynamic;
    String? intentionId;

    print('IntentionDetailController - Arguments received: $intention');
    print(
      'IntentionDetailController - Arguments type: ${intention.runtimeType}',
    );

    if (intention is Map<String, dynamic>) {
      intentionId = intention['id'];
      print('IntentionDetailController - Extracted ID from Map: $intentionId');
    } else if (intention is IntentionData) {
      intentionId = intention.id;
      print(
        'IntentionDetailController - Extracted ID from IntentionData: $intentionId',
      );
    }

    if (intentionId == null) {
      print('IntentionDetailController - No intention ID found');
      isLoading.value = false;
      return;
    }

    print('IntentionDetailController - Fetching details for ID: $intentionId');

    try {
      final response = await IntentionDetailApi.fetchIntentionDetail(
        intentionId,
      );
      print('IntentionDetailController - API Response: $response');

      if (response != null && response.status) {
        print('IntentionDetailController - Setting data: ${response.data}');
        intentionDetailData.value = response.data;
        noteController.text = response.data.note ?? '';
        isLoading.value = false;
      } else {
        print(
          'IntentionDetailController - API response was null or status was false',
        );
        isLoading.value = false;
      }
    } catch (e) {
      print('IntentionDetailController - Error fetching data: $e');
      isLoading.value = false;
    }
  }
}
