import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/your_everyday_tree/controller/my_initiatives_controller.dart';

Widget buildParticipantsChips({required MyInitiativesController controller}) {
  return Obx(
    () => Wrap(
      spacing: 6,
      runSpacing: 6,
      children:
          controller.selectedParticipants
              .map(
                (user) => Chip(
                  label: Text(
                    user.profile.name.isNotEmpty
                        ? user.profile.name
                        : user.email,
                  ),
                  avatar:
                      user.profile.image.isNotEmpty
                          ? CircleAvatar(
                            backgroundImage: NetworkImage(user.profile.image),
                          )
                          : const CircleAvatar(child: Icon(Icons.person)),
                  onDeleted: () => controller.removeParticipant(user),
                ),
              )
              .toList(),
    ),
  );
}
