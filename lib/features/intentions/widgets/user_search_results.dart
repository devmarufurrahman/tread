import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/intentions/controller/intentions_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tread256/core/common/widgets/shimmer_loading.dart';

Widget buildUserSearchResults({
  required AddIntentionsController controller,
  required Function(dynamic) onUserSelected,
}) {
  return Obx(() {
    if (controller.searchResults.isNotEmpty &&
        controller.selectedUserId.value.isEmpty) {
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
          itemCount: controller.searchResults.length,
          itemBuilder: (context, index) {
            final user = controller.searchResults[index];
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  onUserSelected(user);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color:
                        controller.selectedUserId.value == user.id
                            ? Colors.blue.withOpacity(0.1)
                            : Colors.transparent,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.withOpacity(0.2)),
                    ),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child:
                            user.profile.image.isEmpty
                                ? const Icon(Icons.person)
                                : ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: user.profile.image,
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
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.profile.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              user.email,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (controller.selectedUserId.value == user.id)
                        const Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                          size: 20,
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
  });
}
