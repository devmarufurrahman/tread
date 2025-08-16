import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/perosonal_tree/controller/personal_tree_controller.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_build_text_field.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';
import 'package:tread256/core/common/widgets/shimmer_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShowNewConnectionDialog extends StatelessWidget {
  final PersonalTreeController controller;
  const ShowNewConnectionDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    controller.fetchAllContacts;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Add New Person",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      controller.onDialogClosed();
                      Get.back();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Stack(
                children: [
                  CustomBuildTextField(
                    controller: controller.nameController,
                    hintText: "Name",
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Colors.grey,
                    ),
                    onChanged: controller.onNameChanged,
                    isLoading: controller.isLoading.value,
                  ),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Positioned(
                        right: 10,
                        top: 10,
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: ShimmerCircle(size: 20),
                        ),
                      );
                    } else if (controller.selectedUserData.value != null &&
                        controller.nameController.text.isNotEmpty) {
                      return Positioned(
                        right: 5,
                        top: 5,
                        child: CircleAvatar(
                          radius: 20,
                          child:
                              controller
                                      .selectedUserData
                                      .value!
                                      .profile
                                      .image
                                      .isEmpty
                                  ? const Icon(Icons.person)
                                  : ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          controller
                                              .selectedUserData
                                              .value!
                                              .profile
                                              .image,
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                      placeholder:
                                          (context, url) =>
                                              const ShimmerCircle(size: 40),
                                      errorWidget:
                                          (context, url, error) =>
                                              const Icon(Icons.person),
                                    ),
                                  ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  }),
                ],
              ),
              Obx(() {
                if (controller.contactSearchResults.isNotEmpty &&
                    controller.selectedContactNumber.value.isEmpty) {
                  print(
                    'Building search results list with ${controller.searchResults.length} items',
                  );
                  return Container(
                    margin: const EdgeInsets.only(top: 5),
                    constraints: const BoxConstraints(maxHeight: 200),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: .3),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: controller.contactSearchResults.length,
                      itemBuilder: (context, index) {
                        final contact = controller.contactSearchResults[index];

                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              controller.contactSelectUser(contact);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.withValues(alpha: 0.2),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    child:
                                        contact.image!.isEmpty
                                            ? const Icon(Icons.person)
                                            : contact.photoBytes != null
                                            ? CircleAvatar(
                                              backgroundImage: MemoryImage(
                                                contact.photoBytes!,
                                              ),
                                            )
                                            : const CircleAvatar(
                                              child: Icon(Icons.person),
                                            ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          contact.name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          contact.phoneNumber,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[600],
                                          ),
                                        ),
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
              const SizedBox(height: 10),
              CustomBuildTextField(
                controller: controller.relationshipController,
                hintText: "Relationship",
                // onChanged:,
                prefixIcon: const Icon(Icons.link_outlined, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Obx(() {
                return Column(
                  children: [
                    if (controller.selectedUserId.value.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue.withValues(alpha: .1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.person,
                                  size: 16,
                                  color: Colors.blue,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Selected User: ${controller.nameController.text}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (controller
                                .relationshipText
                                .value
                                .isNotEmpty) ...[
                              const SizedBox(height: 4),
                              Obx(
                                () => Row(
                                  children: [
                                    const Icon(
                                      Icons.link,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        'Relationship: ${controller.relationshipText.value}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),

                    const SizedBox(height: 16),
                    Obx(
                      () => CustomButtom(
                        buttonText:
                            controller.isLoading.value
                                ? "Adding..."
                                : "Add Person",
                        onPressed:
                            !controller.canSave.value ||
                                    controller.isLoading.value
                                ? null
                                : () {
                                  controller.toSaveConnection();
                                },
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
