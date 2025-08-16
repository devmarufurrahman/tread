import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tread256/core/global_search/mixin_global_search.dart';
import 'package:tread256/features/your_everyday_tree/api_services/everyday_tree_initiatives_service.dart';
import 'package:tread256/features/your_everyday_tree/api_services/everyday_tree_create_initiative_controller.dart';
import 'package:tread256/features/perosonal_tree/models/user_search_model.dart';
import 'package:tread256/features/your_everyday_tree/models/everyday_tree_create_initiative_model.dart';
import 'package:tread256/features/your_everyday_tree/screen/my_initiatives.dart';

class MyInitiativesController extends GetxController
    with
        EverydayTreeInitiativesService,
        EverydayTreeCreateInitiativeController,
        MixinGlobalSearch {
  // final selectedCategory = ''.obs;
  //  var selectedCategory = 'Meal Train'.obs;

  /// Multi-user selection for initiative participants
  final RxList<UserData> selectedParticipants = <UserData>[].obs;
  final RxString filter = 'All'.obs;
  TextEditingController titleController = TextEditingController();

  void addParticipant(UserData user) {
    if (!selectedParticipants.any((u) => u.id == user.id)) {
      selectedParticipants.add(user);
    }
    participantsController.clear();
    searchResults.clear();
  }

  void removeParticipant(UserData user) {
    selectedParticipants.removeWhere((u) => u.id == user.id);
  }

  void clearParticipants() {
    selectedParticipants.clear();
  }

  void setSelectedTree(String value) {
    selectedCategory.value = value;
  }

  @override
  void onInit() {
    branchNameController.addListener(
      () => onBranchNameChanged(branchNameController.text),
    );
    super.onInit();
    // Show loading when fetching initiatives

    // Fetch initiatives data when screen loads
    fetchInitiatives();
  }

  @override
  void onClose() {
    branchNameController.removeListener(
      () => onBranchNameChanged(branchNameController.text),
    );
    super.onClose();
  }

  Future<void> submitNewInitiative() async {
    final participants = selectedParticipants.map((u) => u.id).toList();
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();

    if (title.isEmpty || description.isEmpty || participants.isEmpty) {
      EasyLoading.showError(
        'Please fill all fields and add at least one participant.',
      );
      return;
    }

    final req = CreateInitiativeRequest(
      categories: title,
      description: description,
      participants: participants,
    );

    final success = await createInitiative(req);

    if (success) {
      fetchInitiatives();
      clearParticipants();
      descriptionController.clear();
      titleController.clear();
      selectedCategory.value = '';
      Get.off(() => MyInitiativesScreen());
    }
  }
}
