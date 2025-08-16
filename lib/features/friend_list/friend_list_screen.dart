import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/perosonal_tree/controller/personal_tree_controller.dart';
import 'package:tread256/core/common/widgets/shimmer_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FriendListScreen extends StatelessWidget {
  final PersonalTreeController controller = Get.put(PersonalTreeController());

  FriendListScreen({super.key}) {
    // Load all friends by default
    controller.searchBranches('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.teal),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'All Friends (Branches)',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.teal),
            ),
            const SizedBox(width: 12),
            Obx(() {
              final count = controller.branchSearchResults.length;
              return Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.teal.shade100,
                    child: Icon(
                      Icons.group,
                      color: Colors.teal.shade700,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$count',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade900,
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: controller.branchNameController,
              decoration: InputDecoration(
                hintText: 'Search friends...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                controller.onBranchNameChanged(value);
                if (value.isEmpty) {
                  controller.searchBranches('');
                }
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isBranchSearchLoading.value) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    children: List.generate(
                      6,
                      (index) => ListTile(
                        leading: const ShimmerCircle(size: 40),
                        title: ShimmerText(height: 16, width: 120),
                        subtitle: ShimmerText(height: 12, width: 80),
                      ),
                    ),
                  ),
                );
              }
              if (controller.branchSearchResults.isEmpty) {
                return const Center(child: Text('No friends found.'));
              }
              return ListView.builder(
                itemCount: controller.branchSearchResults.length,
                itemBuilder: (context, index) {
                  final branch = controller.branchSearchResults[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 38,
                      child:
                          branch.friend.profile.image.isEmpty
                              ? const Icon(Icons.person, size: 38)
                              : ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: branch.friend.profile.image,
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
                    title: Text(
                      branch.friend.profile.name,
                      style: TextStyle(color: Colors.black87),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (branch.friend.email.isNotEmpty)
                          Text(
                            branch.friend.email,
                            style: const TextStyle(fontSize: 13),
                          ),
                        if ((branch.friend.relationship ?? '').isNotEmpty)
                          Text(
                            'Relationship: ${branch.friend.relationship}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.teal,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
