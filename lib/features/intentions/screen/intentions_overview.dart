import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/intentions/controller/intention_detail_controller.dart';
import 'package:tread256/features/intentions/widgets/header_section.dart';
import 'package:tread256/features/intentions/widgets/form_fields.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';

class IntentionsOverview extends StatelessWidget {
  const IntentionsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IntentionDetailController());

    return Obx(() {
      if (controller.isLoading.value) {
        return buildLoadingWidget();
      }

      if (controller.intentionData.value == null) {
        return buildErrorWidget();
      }

      final intentionData = controller.intentionData.value!;

      return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Image and Checkmark
              HeaderSection(
                headerText:
                    intentionData.completedAction
                        ? 'Intention Overview'
                        : 'Intention Details',
                immagePath: intentionData.userInfo.image,
                boxHeight: 10,
              ),

              SizedBox(height: 20),

              // Intention Overview Card
              buildIntentionOverviewCard(intentionData: intentionData),

              SizedBox(height: 20),

              // Private Notes Section , another user see or not
              intentionData.urlActive
                  ? intentionData.completedAction
                      ? buildPrivateNotesSection(
                        controller: controller,
                        urlActive: intentionData.urlActive,
                      )
                      : SizedBox.shrink()
                  : SizedBox.shrink(),

              SizedBox(height: 30),
              if (intentionData.urlActive)
                Obx(() {
                  final isCompleted = intentionData.completedAction;
                  final canSave = controller.canSaveNote.value;

                  return CustomButtom(
                    buttonText: isCompleted ? "Save Note" : 'Completed Action',
                    onPressed:
                        isCompleted
                            ? (canSave
                                ? () {
                                  controller.refreshIntentionsList();
                                  controller.makeUpdateNote();
                                }
                                : null)
                            : () {
                              controller.completeIntention();
                            },
                  );
                }),

              SizedBox(height: 30),
            ],
          ),
        ),
      );
    });
  }
}
