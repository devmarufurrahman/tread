import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/perosonal_tree/controller/personal_tree_controller.dart';

Widget buildActionListItem({
  required String actionTitle,
  required String actionDate,
  required String actionTime,
  required bool isCompleted,
  String? actionId,
  PersonalTreeController? controller,
}) {
  return Card(
    color: Colors.grey[200],
    margin: const EdgeInsets.only(bottom: 15),
    elevation: 0,
    child: ListTile(
      leading: Image.asset(
        isCompleted ? "assets/icons/right.png" : "assets/icons/right2.png",
        height: isCompleted ? null : 40,
      ),
      title: Text(actionTitle, style: TextStyle(color: Colors.black)),
      subtitle: Text(
        "$actionDate at $actionTime",
        style: TextStyle(color: Colors.black54),
      ),
      onTap:
          isCompleted || actionId == null || controller == null
              ? null
              : () {
                showCompleteActionDialog(
                  context: Get.context!,
                  actionTitle: actionTitle,
                  actionId: actionId,
                  controller: controller,
                );
              },
    ),
  );
}

void showCompleteActionDialog({
  required BuildContext context,
  required String actionTitle,
  required String actionId,
  required PersonalTreeController controller,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Complete Action', style: TextStyle(fontSize: 22)),
        content: Text(
          'Do you want to complete the action: "$actionTitle"?',
          style: TextStyle(fontSize: 17),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('No', style: TextStyle(fontSize: 20)),
          ),
          TextButton(
            onPressed: () async {
              controller.markActionCompletedLocally(actionId);
              Navigator.of(context).pop();
              await controller.completeAction(actionId);
            },
            child: const Text('Yes', style: TextStyle(fontSize: 20)),
          ),
        ],
      );
    },
  );
}
