import 'package:get/get.dart';
import 'package:tread256/core/global_search/mixin_global_search.dart';
import 'package:tread256/features/perosonal_tree/api_services/mixin_completed_action_count.dart';
import 'package:tread256/features/perosonal_tree/api_services/mixin_complete_action.dart';
import 'package:tread256/features/perosonal_tree/api_services/mixin_create_persola_tree_action.dart';
import 'package:tread256/features/perosonal_tree/api_services/mixin_fetch_intentional_act.dart';
import 'package:tread256/features/perosonal_tree/api_services/mixin_fetch_leavs_count.dart';
import 'package:tread256/features/perosonal_tree/api_services/mixin_fetch_profile.dart';
import 'package:tread256/features/perosonal_tree/api_services/mixin_get_total_friend.dart';
import 'package:tread256/features/main_screen/controller/tree_slider_controller.dart';
import 'package:tread256/features/perosonal_tree/models/friend_profile_model.dart';

import '../../calender/controller/calendar_controller.dart';

class PersonalTreeController extends GetxController
    with
        MixinGlobalSearch,
        MixinFetchProfile,
        MixinCreatePersolaTreeAction,
        MixinFetchLeavsCount,
        MixinCompletedActionCount,
        MixinFetchIntentionalAct,
        MixinGetTotalFriend,
        MixinCompleteAction {
  var relationshipText = ''.obs;
  final RxBool showCompleted = false.obs;
  final CalendarController calendarController = Get.put(CalendarController());

  // Reference to the tree slider controller
  late TreeSliderController treeSliderController;

  @override
  void onInit() {
    super.onInit();
    nameController.addListener(_onNameChanged);
    relationshipController.addListener(
      () => onRelationshipChanged(relationshipController.text),
    );
    branchNameController.addListener(
      () => onBranchNameChanged(branchNameController.text),
    );

    // Get the tree slider controller instance
    treeSliderController = Get.find<TreeSliderController>();

    // // Refresh data when screen becomes visible
    // ever(isIntentionalActsOn, (_) {
    //   if (isIntentionalActsOn.value) {
    //     fetchIntentionalActs();
    //   }
    // });
  }

  @override
  void onReady() {
    super.onReady();
    fetchLeavesCount();
    getTotalAddedFriend();
    fetchCompletedActionCount();
    fetchIntentionalActs();
  }

  @override
  void onClose() {
    nameController.removeListener(_onNameChanged);
    relationshipController.removeListener(
      () => onRelationshipChanged(relationshipController.text),
    );
    branchNameController.removeListener(
      () => onBranchNameChanged(branchNameController.text),
    );
    nameController.dispose();
    relationshipController.dispose();
    branchNameController.dispose();
    actionTitleController.dispose();
    actionDescriptionController.dispose();
    actionDateController.dispose();
    actionTimeController.dispose();
    super.onClose();
  }

  void _onNameChanged() {
    if (nameController.text.trim().length >= 2) {
      // searchUsers(nameController.text);
      searchContactUsers(nameController.text);
    } else {
      searchResults.clear();
    }
    updateCanSave();
  }

  void onRelationshipChanged(String value) {
    relationshipText.value = value;
    updateCanSave();
  }

  void onDialogClosed() {
    clearFields();
    getTotalAddedFriend();
  }

  void refreshLeavesCount() {
    fetchLeavesCount();
  }

  // Method to refresh the family tree image
  // Future<void> refreshFamilyTreeImage() async {
  //   await treeSliderController.fetchAndGenerateTreeImage(
  //     calendarController.selectedAllDate.value,
  //   );
  // }

  @override
  Future<void> refreshDataAfterActionComplete() async {
    // Refresh all relevant data after completing an action
    await fetchCompletedActionCount();
    await fetchIntentionalActs();
    await fetchLeavesCount();

    // Refresh the family tree image
    // await refreshFamilyTreeImage();

    // Also refresh the friend profile if we're on a user profile screen
    if (selectedUserId.value.isNotEmpty) {
      await fetchFriendProfile(selectedUserId.value);
    }
  }

  void markActionCompletedLocally(String actionId) {
    final profile = friendProfile.value;
    if (profile == null) return;
    final actions = profile.data.actions;
    final idx = actions.indexWhere((a) => a.id == actionId);
    if (idx != -1) {
      // Create a new Action with completed = true (since Action is immutable)
      final old = actions[idx];
      actions[idx] = Action(
        id: old.id,
        actionCreator: old.actionCreator,
        actionMember: old.actionMember,
        actionTitle: old.actionTitle,
        actionDescription: old.actionDescription,
        actionDate: old.actionDate,
        actionTime: old.actionTime,
        fullDateTime: old.fullDateTime,
        completed: true,
        createdAt: old.createdAt,
        updatedAt: old.updatedAt,
      );
      // Trigger UI update
      friendProfile.refresh();
    }
  }
}
