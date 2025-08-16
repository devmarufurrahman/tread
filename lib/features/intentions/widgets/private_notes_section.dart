import 'package:flutter/material.dart';
import 'package:tread256/features/intentions/controller/intention_detail_controller.dart';
import 'package:tread256/features/intentions/widgets/custom_input_decoration.dart';

Widget buildPrivateNotesSection({
  required IntentionDetailController controller,
  required bool urlActive,
}) {
  return Container(
    padding: EdgeInsets.all(0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Private Notes',
            style: TextStyle(color: Color(0xff57B396), fontSize: 28),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Reflection or Details',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller.noteController,
          decoration: customInputDecoration(
            hintText: 'Add your thought or note...',
          ),
          maxLines: 8,
          readOnly: !urlActive,
        ),
      ],
    ),
  );
}
