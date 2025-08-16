import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/your_everyday_tree/controller/my_initiatives_controller.dart';
import 'package:tread256/core/common/widgets/shimmer_loading.dart';

Widget buildParticipantSearchField({
  required MyInitiativesController controller,
}) {
  return Obx(
    () => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller.participantsController,
          onChanged: controller.onNameChanged,
          decoration: InputDecoration(
            hintText: 'Type Names Or Emails',
            hintStyle: TextStyle(
              color: Color(0x9E535A6C),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: Color(0xFFF8F8F7),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFFE0E0E0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFFE0E0E0)),
            ),
            suffixIcon:
                controller.isLoading.value
                    ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: ShimmerCircle(size: 20),
                      ),
                    )
                    : Icon(Icons.group_outlined, color: Color(0xFF535A6C)),
          ),
        ),
        if (controller.searchResults.isNotEmpty &&
            controller.participantsController.text.isNotEmpty)
          buildSearchResultsDropdown(controller),
      ],
    ),
  );
}

Widget buildSearchResultsDropdown(MyInitiativesController controller) {
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
            onTap: () => controller.addParticipant(user),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.withOpacity(0.2)),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        user.profile.image.isNotEmpty
                            ? NetworkImage(user.profile.image)
                            : null,
                    child:
                        user.profile.image.isEmpty
                            ? const Icon(Icons.person)
                            : null,
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
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
