import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/intentions/widgets/custom_input_decoration.dart';
import 'package:tread256/features/perosonal_tree/controller/personal_tree_controller.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';

Widget buildAddActionBottomSheet({
  required PersonalTreeController controller,
  required BuildContext context,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Add New Actions",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close, size: 35, weight: 800),
                onPressed: () {
                  controller.clearActionForm();
                  Get.back();
                  controller.fetchIntentionalActs();
                },
              ),
            ],
          ),
          TextField(
            controller: controller.actionTitleController,
            decoration: customInputDecoration(hintText: "Actions Title"),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller.actionDescriptionController,
            decoration: customInputDecoration(hintText: 'Descriptions'),
            maxLines: 6,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller.actionDateController,
            decoration: customInputDecoration(hintText: "Date (MM-DD-YYYY)"),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
              );
              if (date != null) {
                controller.actionDateController.text =
                    "${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}-${date.year}";
              }
            },
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller.actionTimeController,
            decoration: customInputDecoration(hintText: "Time (HH:MM)"),
            onTap: () async {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (time != null) {
                controller.actionTimeController.text =
                    "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
              }
            },
          ),
          const SizedBox(height: 30),
          Obx(
            () => CustomButtom(
              buttonText:
                  controller.isCreatingAction.value
                      ? "Creating..."
                      : "Apply Now",
              onPressed:
                  controller.isCreatingAction.value
                      ? null
                      : () async {
                        await controller.createPersonalTreeAction();
                      },
            ),
          ),
        ],
      ),
    ),
  );
}
