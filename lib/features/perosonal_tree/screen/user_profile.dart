import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/perosonal_tree/controller/personal_tree_controller.dart';
import 'package:tread256/features/perosonal_tree/widgets/personal_tree_widgets.dart';

class UserProfile extends StatelessWidget {
  final Map<String, dynamic>? data;
  final PersonalTreeController controller = Get.find<PersonalTreeController>();

  UserProfile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          controller.refreshLeavesCount();
          controller.refreshIntentionalActs();
        }
      },
      child: Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.zero,
          bottom: false,
          child: Obx(() {
            if (controller.isLoading.value) {
              return Scaffold(
                body: Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 60,
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      // Shimmer for profile header
                      Container(
                        height: 120,
                        margin: const EdgeInsets.only(bottom: 20),
                        child: const ActionShimmerLoading(),
                      ),
                      // Shimmer for actions list
                      Expanded(child: const ActionShimmerLoading()),
                    ],
                  ),
                ),
              );
            }

            final friendProfile = controller.friendProfile.value;

            // Handle null friend profile
            if (friendProfile == null) {
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Failed to load profile data',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.selectedUserId.value.isNotEmpty) {
                            controller.fetchFriendProfile(
                              controller.selectedUserId.value,
                            );
                          }
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            }

            final profileData = friendProfile.data.profile.friend.profile;
            final actions = friendProfile.data.actions;

            // print('Profile Data: ${profileData?.name}');
            // print('Number of Actions: ${actions.length}');
            // print('Actions: $actions');

            return Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.only(
                  top: 0,
                  left: 20,
                  right: 20,
                  bottom: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Header
                    Obx(
                      () => buildProfileHeader(
                        profileName: profileData?.name,
                        profileImage: profileData?.image,
                        count:
                            controller.showCompleted.value
                                ? actions
                                    .where((action) => action.completed)
                                    .length
                                : actions
                                    .where((action) => !action.completed)
                                    .length,
                        isCompleted: controller.showCompleted.value,
                        fallbackName: data?['name'],
                      ),
                    ),

                    // Actions List Section
                    Expanded(
                      child: buildActionsListSection(
                        controller: controller,
                        actions: actions,
                        context: context,
                      ),
                    ),

                    // Add New Action Button
                    // CustomButtom(
                    //   buttonText: "Add New Action",
                    //   onPressed: () {
                    //     Get.bottomSheet(
                    //       isDismissible: false,
                    //       buildAddActionBottomSheet(
                    //         controller: controller,
                    //         context: context,
                    //       ),
                    //       isScrollControlled: true,
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
            );
          }),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: FloatingActionButton(
            backgroundColor: AppColors.primary,
            onPressed: () {
              Get.bottomSheet(
                isDismissible: false,
                buildAddActionBottomSheet(
                  controller: controller,
                  context: context,
                ),
                isScrollControlled: true,
              );
            },
            child: Icon(Icons.flash_on, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
