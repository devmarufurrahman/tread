import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/perosonal_tree/controller/personal_tree_controller.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_toggle_switch.dart';
import 'package:tread256/features/perosonal_tree/widgets/empty_state_widget.dart';
import 'package:tread256/features/perosonal_tree/widgets/action_list_item.dart';
import 'package:tread256/features/perosonal_tree/widgets/action_shimmer_loading.dart';

Widget buildActionsListSection({
  required PersonalTreeController controller,
  required List<dynamic> actions,
  required BuildContext context,
}) {
  return Column(
    children: [
      CustomToggleButton(
        controller: controller,
        leftText: "Completed",
        rightText: "Open Acts",
        backgroundColor: Colors.grey[200]!,
        activeColor: AppColors.primary,
        inactiveColor: AppColors.primary,
        textActiveColor: Colors.white,
        textInactiveColor: Colors.black,
        widthFactor: 0.8,
        height: 40.0,
        borderRadius: 10.0,
        padding: 0.0,
        isActive: controller.showCompleted,
      ),
      const SizedBox(height: 10),
      Expanded(
        // height: MediaQuery.of(context).size.height * .6,
        child: Obx(() {
          if (controller.isLoading.value) {
            return const ActionShimmerLoading();
          }

          if (controller.showCompleted.value) {
            final completedActions =
                actions.where((action) => action.completed).toList();

            if (completedActions.isEmpty) {
              return buildEmptyState();
            }

            return ListView.builder(
              padding: EdgeInsets.only(top: 7),
              itemCount: completedActions.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final action = completedActions[index];
                return buildActionListItem(
                  actionTitle: action.actionTitle,
                  actionDate: action.actionDate,
                  actionTime: action.actionTime,
                  isCompleted: true,
                  actionId: action.id,
                  controller: controller,
                );
              },
            );
          } else {
            final openActions =
                actions.where((action) => !action.completed).toList();

            if (openActions.isEmpty) {
              return buildEmptyState();
            }

            return ListView.builder(
              padding: EdgeInsets.only(top: 7),
              itemCount: openActions.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final action = openActions[index];
                return buildActionListItem(
                  actionTitle: action.actionTitle,
                  actionDate: action.actionDate,
                  actionTime: action.actionTime,
                  isCompleted: false,
                  actionId: action.id,
                  controller: controller,
                );
              },
            );
          }
        }),
      ),
    ],
  );
}
