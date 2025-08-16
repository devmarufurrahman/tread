import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/perosonal_tree/controller/personal_tree_controller.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_build_text_field.dart';
import 'package:tread256/core/common/widgets/shimmer_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShowBranchesDialog extends StatelessWidget {
  final PersonalTreeController controller;
  const ShowBranchesDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Add New Branch",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomBuildTextField(
                controller: controller.branchNameController,
                hintText: "Branch Name",
                prefixIcon: const Icon(
                  Icons.account_tree_outlined,
                  color: Colors.grey,
                ),
                suffixIcon: Obx(
                  () =>
                      controller.isBranchSearchLoading.value
                          ? const SizedBox(
                            width: 15,
                            height: 15,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ShimmerCircle(size: 15),
                            ),
                          )
                          : const SizedBox.shrink(),
                ),
                onChanged: controller.onBranchNameChanged,
              ),
              Obx(() {
                if (controller.branchSearchResults.isNotEmpty &&
                    controller.selectedBranchId.value.isEmpty &&
                    controller.branchNameController.text.isNotEmpty) {
                  return Container(
                    margin: const EdgeInsets.only(top: 5),
                    constraints: const BoxConstraints(maxHeight: 200),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: controller.branchSearchResults.length,
                      itemBuilder: (context, index) {
                        final branch = controller.branchSearchResults[index];
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              controller.selectBranch(branch, controller);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    controller.selectedBranchId.value ==
                                            branch.friend.id
                                        ? Colors.blue.withOpacity(0.1)
                                        : Colors.transparent,
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    child:
                                        branch.friend.profile.image.isEmpty
                                            ? const Icon(Icons.person)
                                            : ClipOval(
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    branch.friend.profile.image,
                                                width: 40,
                                                height: 40,
                                                fit: BoxFit.cover,
                                                placeholder:
                                                    (context, url) =>
                                                        const ShimmerCircle(
                                                          size: 40,
                                                        ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(
                                                          Icons.person,
                                                        ),
                                              ),
                                            ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          branch.friend.profile.name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        if (branch.friend.email.isNotEmpty) ...[
                                          const SizedBox(height: 2),
                                          Text(
                                            branch.friend.email,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
