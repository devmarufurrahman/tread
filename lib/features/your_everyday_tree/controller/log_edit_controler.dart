import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tread256/features/your_everyday_tree/api_services/log_api.dart';
import '../../../core/global_search/mixin_global_search.dart';
import '../../perosonal_tree/api_services/mixin_fetch_profile.dart';
import '../../perosonal_tree/models/user_search_model.dart';

class LogEditControler extends GetxController
    with MixinGlobalSearch, MixinFetchProfile {
  final whatDidYouDoController = TextEditingController();
  final dateController = TextEditingController();
  var participants = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    nameController.addListener(_onNameChanged);
    fetchAndPopulateActivities();
  }

  @override
  void onClose() {
    whatDidYouDoController.dispose();
    dateController.dispose();
    nameController.removeListener(_onNameChanged);
    nameController.dispose();
    super.onClose();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          dateController.text.isNotEmpty
              ? DateFormat('MM-dd-yyyy').parse(dateController.text)
              : DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      dateController.text = DateFormat('MM-dd-yyyy').format(picked);
    }
  }

  void _onNameChanged() {
    if (nameController.text.length >= 2) {
      // isLoading.value = true;
      searchUsers(nameController.text);
    } else {
      searchResults.clear();
    }
    updateCanSave();
  }

  void selectUser(UserData user) {
    selectedUserId.value = user.id;
    nameController.text = user.profile.name;
    selectedUserData.value = user;
    // isLoading.value = false;
    updateCanSave();
    participants.add(selectedUserId.value);
  }

  void onNameChanged(String value) {
    if (value.isEmpty) {
      clearFields();
      return;
    }
    searchUsers(value);
  }

  Future<void> fetchAndPopulateActivities() async {
    try {
      EasyLoading.show(status: 'Loading activities...');
      final activities = await fetchActivities();
      if (activities.isNotEmpty) {
        final log = activities.first;
        whatDidYouDoController.text = log.data.whatDidYouDo;
        dateController.text = log.data.date.toIso8601String().substring(0, 10);
        nameController.text =
            log.data.participants.isNotEmpty
                ? (log.data.participants.first.profile.name)
                : '';
        EasyLoading.showSuccess('Fatched');
      } else {
        EasyLoading.showInfo('No activities available to edit');
      }
    } catch (e) {
      EasyLoading.showError('Failed to load activities: $e');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void updateLog() {
    if (whatDidYouDoController.text.isEmpty ||
        dateController.text.isEmpty ||
        selectedUserId.value.isEmpty) {
      EasyLoading.showError('Please fill in all fields');
      return;
    }

    final logData = {
      'whatDidYouDo': whatDidYouDoController.text,
      'date': dateController.text,
      'participants': participants.toList(),
    };

    EasyLoading.show(status: 'Updating log...');
    updateActivity(logData)
        .then((response) {
          EasyLoading.showSuccess('Log updated successfully');
          Get.back();
        })
        .catchError((error) {
          EasyLoading.showError('Failed to update log: $error');
        })
        .whenComplete(() {
          EasyLoading.dismiss();
        });
  }
}
