import 'package:flutter/material.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/intentions/controller/intentions_controller.dart';
import 'package:tread256/features/intentions/widgets/custom_input_decoration.dart';

Widget buildTextField({
  TextEditingController? controller,
  String? label,
  required String hintText,
  int? maxLines = 1,
  AddIntentionsController? intentionController,
  final Color? fillColor,
  Widget? prefixIcon,
  Widget? suffixIcon,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label ?? "",
        style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
      ),
      SizedBox(height: 10),
      TextFormField(
        controller: controller,
        onChanged: intentionController?.onNameChanged,
        decoration:
            maxLines == null
                ? customInputDecoration(
                  hintText: hintText,
                ).copyWith(prefixIcon: prefixIcon, suffixIcon: suffixIcon)
                : InputDecoration(
                  fillColor: fillColor,
                  labelText: hintText,
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
        maxLines: maxLines,
      ),
    ],
  );
}
