import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/global_search/mixin_global_search.dart';
import '../../perosonal_tree/api_services/mixin_fetch_profile.dart';
import '../../perosonal_tree/models/user_search_model.dart';

class LogCreateAndDetailsController extends GetxController
    with MixinGlobalSearch, MixinFetchProfile {
  final whatDidYouDoController = TextEditingController();
  final dateController = TextEditingController();
  var participants = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    nameController.addListener(_onNameChanged);
  }

  @override
  void onClose() {
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
      dateController.text = DateFormat('MM/dd/yyyy').format(picked);
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
    print('Selected user: ${user.profile.name}');
    participants.add(selectedUserId.value);
  }

  void onNameChanged(String value) {
    if (value.isEmpty) {
      clearFields();
      return;
    }
    searchUsers(value);
  }
}
