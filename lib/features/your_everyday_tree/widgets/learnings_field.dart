import 'package:flutter/material.dart';
import 'package:tread256/core/common/styles/input_decoration.dart';

Widget buildLearningsField({required TextEditingController controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'What Did You Learn?',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
      const SizedBox(height: 8),
      TextFormField(
        controller: controller,
        maxLines: 6,
        decoration: CustomInputDecoration.customInputDecoration(
          hintText: 'Share insights,or feedback...........',
        ),
      ),
    ],
  );
}
