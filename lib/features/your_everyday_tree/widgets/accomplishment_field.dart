import 'package:flutter/material.dart';
import 'package:tread256/core/common/styles/input_decoration.dart';

Widget buildAccomplishmentField({required TextEditingController controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'What was accomplished?',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Color(0xff535A6C),
        ),
      ),
      const SizedBox(height: 8),
      TextFormField(
        controller: controller,
        maxLines: 4,
        decoration: CustomInputDecoration.customInputDecoration(
          hintText: 'Describe meals delivered, people helped....',
        ),
      ),
    ],
  );
}
