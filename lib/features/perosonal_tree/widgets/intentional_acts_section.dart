import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/perosonal_tree/controller/personal_tree_controller.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_toggle_switch.dart';
import 'package:tread256/features/perosonal_tree/widgets/intentional_act_row.dart';
import 'package:tread256/features/perosonal_tree/widgets/section_header.dart';
import 'package:tread256/core/common/widgets/shimmer_loading.dart';

class IntentionalActsSection extends StatelessWidget {
  final PersonalTreeController controller;

  const IntentionalActsSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          SectionHeader(title: "Intentional Acts"),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Obx(() => Text(
              "${controller.intentionalActs.where((i) => i.actionCompleted).length}/${controller.intentionalActs.length}",
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
            CustomToggleButton(
              controller: controller,
              onToggle: () => controller.toggleIntentionalActs(),
              isActive: controller.isIntentionalActsOn,
            ),
          ],
        ),
        Obx(
          () =>
              controller.isIntentionalActsOn.value
                  ? controller.isLoadingIntentionalActs.value
                      ? Container(
                        constraints: const BoxConstraints(maxHeight: 300),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const ShimmerListTile(
                              margin: EdgeInsets.only(bottom: 8),
                            );
                          },
                        ),
                      )
                      : controller.intentionalActs.isEmpty
                      ? const Center(
                        child: Text("No intentional acts added yet"),
                      )
                      : Container(
                        constraints: BoxConstraints(maxHeight: 300),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: controller.intentionalActs.length,
                          itemBuilder: (context, index) {
                            final act = controller.intentionalActs[index];
                            return IntentionalActRow(
                              index: index,
                              title: act.actionTitle,
                              isCompleted: act.actionCompleted,
                              userName: act.userName,
                              userImage: act.userImage,
                            );
                          },
                          separatorBuilder: (_, __) => const Divider(),
                        ),
                      )
                  : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
