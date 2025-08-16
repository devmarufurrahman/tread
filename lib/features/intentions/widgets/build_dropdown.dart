import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/intentions/controller/intentions_controller.dart';
import 'package:tread256/features/intentions/widgets/custom_input_decoration.dart';

Widget buildDropdown({
  required String label,
  required String hintText,
  required RxString selectedValue,
  required List<String> items,
  required void Function(String?) onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
      ),
      SizedBox(height: 10),
      GetX<AddIntentionsController>(
        builder:
            (controller) => DropdownButtonFormField<String>(
              value: selectedValue.value.isEmpty ? null : selectedValue.value,
              hint: Text(hintText, style: TextStyle(color: Colors.black54)),
              decoration: customInputDecoration(hintText: ''),
              items:
                  items.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              value,
                              overflow: TextOverflow.visible,
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: AppColors.primary.withValues(
                              alpha: .3,
                            ),
                            radius: 15,
                            child: const Icon(
                              Icons.eco,
                              color: Colors.green,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
              onChanged: onChanged,
              dropdownColor: Colors.white,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
              isExpanded: true,
              menuMaxHeight: 200,
            ),
      ),
    ],
  );
}
