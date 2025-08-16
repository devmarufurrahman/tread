import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tread256/core/global_search/mixin_global_search.dart';
import 'package:tread256/features/intentions/api_services/mixin_intentions_post.dart';
import 'package:tread256/features/intentions/api_services/mixin_intentions_response.dart';
import 'package:add_2_calendar/add_2_calendar.dart';

class AddIntentionsController extends GetxController
    with MixinIntentionsResponse, MixinIntentionsPost, MixinGlobalSearch {
  final RxString filter = 'All'.obs;

  void setSelectedTree(String value) {
    selectedCategory.value = value;
  }

  void clearSelectedUser() {
    selectedUserId.value = '';
    selectedUserData.value = null;
    personNameController.clear();
    searchResults.clear();
  }

  @override
  void onInit() {
    super.onInit();
    // personNameController.text = 'SALAH'; We can initialize this at the begainig
    dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    intentions();
  }

  @override
  void onClose() {
    personNameController.dispose();
    titleController.dispose();
    dateController.dispose();
    relationshipController.dispose();
    noteController.dispose();

    super.onClose();
  }

  void saveIntention() async {
    addIntentionToCalendar();
    await postIntentions();

    await intentions();
    clearSelectedUser();

    // personNameController.clear();
    // titleController.clear();
    // dateController.clear();
    // relationshipController.clear();
    // noteController.clear();
    // selectedTree.value = '';
    // selectedCategory.value = '';
  }

  void addIntentionToCalendar() {
    try {
      final title = titleController.text.trim();
      final userName = selectedUserData.value?.profile.name ?? '';
      final description = "Action with $userName ${noteController.text.trim()}";
      final dateString = dateController.text.trim();
      if (title.isEmpty || dateString.isEmpty) return;
      final startDate = DateTime.tryParse(dateString);
      if (startDate == null) return;
      final event = Event(
        title: title,
        description: description,
        location: '',
        startDate: startDate,
        endDate: startDate.add(const Duration(hours: 1)),
      );
      Add2Calendar.addEvent2Cal(event);
    } catch (e) {
      print('Failed to add event to calendar: $e');
    }
  }

  Future<void> refreshIntention() async {
    await intentions();
  }
}
