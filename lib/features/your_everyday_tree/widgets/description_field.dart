import 'package:flutter/material.dart';
import 'package:tread256/features/your_everyday_tree/controller/my_initiatives_controller.dart';

Widget buildDescriptionField({required MyInitiativesController controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: const Text(
          'Description',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xff535A6C),
          ),
        ),
      ),
      const SizedBox(height: 8),
      TextFormField(
        controller: controller.descriptionController,
        maxLines: 4,
        decoration: InputDecoration(
          hintText: 'Description....',
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
        ),
      ),
    ],
  );
}
