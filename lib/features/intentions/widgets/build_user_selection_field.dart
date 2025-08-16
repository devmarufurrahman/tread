import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/intentions/controller/intentions_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tread256/core/common/widgets/shimmer_loading.dart';

Widget buildUserSelectionField({
  TextEditingController? controller,
  String? label,
  required String hintText,
  AddIntentionsController? intentionController,
  required RxString selectedUserId,
  required RxList searchResults,
  required Function(dynamic) onUserSelected,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label ?? "",
        style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
      ),
      SizedBox(height: 10),
      Obx(() {
        final selectedUser = intentionController?.selectedUserData.value;

        // Update the controller text when a user is selected
        if (selectedUser != null && controller != null) {
          controller.text = selectedUser.profile.name;
        }

        return TextFormField(
          controller: controller,
          onChanged:
              selectedUser == null ? intentionController?.onNameChanged : null,
          readOnly: selectedUser != null,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[500],
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ).copyWith(
            prefixIcon:
                selectedUser != null
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 16,
                        child:
                            selectedUser.profile.image.isEmpty
                                ? const Icon(Icons.person, size: 16)
                                : ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: selectedUser.profile.image,
                                    width: 32,
                                    height: 32,
                                    fit: BoxFit.cover,
                                    placeholder:
                                        (context, url) =>
                                            const ShimmerCircle(size: 32),
                                    errorWidget:
                                        (context, url, error) =>
                                            const Icon(Icons.person, size: 16),
                                  ),
                                ),
                      ),
                    )
                    : const Icon(Icons.person, color: Colors.grey),
            suffixIcon:
                selectedUser != null
                    ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        intentionController?.clearSelectedUser();
                        if (controller != null) {
                          controller.clear();
                        }
                      },
                    )
                    : const Icon(Icons.search, color: Colors.grey),
          ),
        );
      }),
    ],
  );
}
