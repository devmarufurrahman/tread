import 'package:get/get.dart';
import 'package:tread256/features/intentions/api_services/intention_detail_api.dart';
import 'package:tread256/features/intentions/api_services/mixin_intention_completed.dart';
import 'package:tread256/features/intentions/api_services/mixin_updateNote.dart';
import 'package:tread256/features/intentions/controller/intentions_controller.dart';
import 'package:tread256/features/intentions/models/intention_detail_response.dart';
import 'package:tread256/features/intentions/models/intentions_response.dart';
import 'package:flutter/material.dart';

class IntentionDetailController extends GetxController
    with MixinIntentionCompleted, MixinUpdatenote {
  final intentionData = Rx<IntentionDetailData?>(null);
  final isLoading = true.obs;

  @override
  final noteController = TextEditingController();
  String originalNote = '';
  final canSaveNote = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchIntentionDetail();
    // Add listener to noteController to update canSaveNote
    noteController.addListener(updateCanSaveNote);
  }

  @override
  void onClose() {
    noteController.removeListener(updateCanSaveNote);
    noteController.dispose();
    super.onClose();
  }

  void updateCanSaveNote() {
    canSaveNote.value = hasNoteChanged && noteController.text.trim().isNotEmpty;
  }

  Future<void> fetchIntentionDetail() async {
    final intention = Get.arguments as dynamic;
    String? intentionId;

    if (intention is Map<String, dynamic>) {
      intentionId = intention['id'];
    } else if (intention is IntentionData) {
      intentionId = intention.id;
    }

    if (intentionId == null) {
      isLoading.value = false;
      return;
    }

    try {
      final response = await IntentionDetailApi.fetchIntentionDetail(
        intentionId,
      );

      if (response != null && response.status) {
        intentionData.value = response.data;
        noteController.text = response.data.note ?? '';
        originalNote = response.data.note ?? '';
        updateCanSaveNote();
        isLoading.value = false;
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  bool get hasNoteChanged => noteController.text.trim() != originalNote.trim();

  Future<void> completeIntention() async {
    if (intentionData.value == null) return;

    final intentionId = intentionData.value!.id;

    try {
      await intentionCompleted(seletedIntentionId: intentionId);

      await fetchIntentionDetail();

      await refreshIntentionsList();
    } catch (e) {
      print('Error completing intention: $e');
    }
  }

  Future<void> makeUpdateNote() async {
    if (intentionData.value == null) return;

    final intentionId = intentionData.value!.id;
    try {
      await updateNote(id: intentionId);

      originalNote = noteController.text.trim();
      updateCanSaveNote();

      Get.back();

      await refreshIntentionsList();
    } catch (e) {
      print('Error updating note: $e');
    }
  }

  Future<void> refreshIntentionsList() async {
    try {
      final intentionsController = Get.find<AddIntentionsController>();
      await intentionsController.refreshIntention();
    } catch (e) {
      print('Could not find AddIntentionsController: $e');

      Get.back();
    }
  }
}
