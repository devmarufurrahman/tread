import 'package:flutter/material.dart';
import 'package:tread256/features/your_everyday_tree/controller/my_initiatives_controller.dart';
import 'package:tread256/features/your_everyday_tree/widgets/participants_chips.dart';
import 'package:tread256/features/your_everyday_tree/widgets/participant_search_field.dart';

Widget buildParticipantsSection({required MyInitiativesController controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: const Text(
          'Add People',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xff535A6C),
          ),
        ),
      ),
      const SizedBox(height: 8),

      // Chips for selected participants
      buildParticipantsChips(controller: controller),

      // Input field for searching/adding participants
      buildParticipantSearchField(controller: controller),
    ],
  );
}
