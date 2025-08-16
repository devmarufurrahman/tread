import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';
import 'package:tread256/features/your_everyday_tree/controller/my_initiatives_controller.dart';
import 'package:tread256/features/your_everyday_tree/screen/my_initiatives.dart';
import 'package:tread256/features/your_everyday_tree/models/everyday_tree_create_initiative_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tread256/features/your_everyday_tree/widgets/document_meal_train_widgets.dart';
import 'package:tread256/features/your_everyday_tree/api_services/progress_overview_controller.dart';

class DocumentMealTrainScreen extends StatelessWidget {
  final String initiativeId;

  const DocumentMealTrainScreen({super.key, required this.initiativeId});

  @override
  Widget build(BuildContext context) {
    final MyInitiativesController controller =
        Get.find<MyInitiativesController>();

    // Form controllers
    final TextEditingController whatWasAccomplishedController =
        TextEditingController();
    final TextEditingController whatDidYouLearnController =
        TextEditingController();
    final TextEditingController startTimeController = TextEditingController();
    final TextEditingController endTimeController = TextEditingController();
    return Scaffold(
      appBar: buildDocumentHeader(title: 'Document Meal Train'),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDocumentDescription(
                description:
                    'Share Details And Outcomes Of Your Meal Train Initiative To Celebrate Your Impact.',
              ),
              buildAccomplishmentField(
                controller: whatWasAccomplishedController,
              ),
              const SizedBox(height: 20),
              buildDurationSection(
                startTimeController: startTimeController,
                endTimeController: endTimeController,
                context: context,
              ),
              const SizedBox(height: 20),
              buildLearningsField(controller: whatDidYouLearnController),
              SizedBox(height: 50),
              Obx(
                () => CustomButtom(
                  buttonText:
                      controller.isFetchingDetails.value
                          ? 'Loading...'
                          : 'Save document',
                  onPressed:
                      controller.isFetchingDetails.value
                          ? null
                          : () => saveDocument(
                            controller,
                            whatWasAccomplishedController,
                            whatDidYouLearnController,
                            startTimeController,
                            endTimeController,
                          ),
                  vertical: 20,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveDocument(
    MyInitiativesController controller,
    TextEditingController whatWasAccomplishedController,
    TextEditingController whatDidYouLearnController,
    TextEditingController startTimeController,
    TextEditingController endTimeController,
  ) async {
    if (whatWasAccomplishedController.text.trim().isEmpty ||
        whatDidYouLearnController.text.trim().isEmpty ||
        startTimeController.text.trim().isEmpty ||
        endTimeController.text.trim().isEmpty) {
      EasyLoading.showError('Please fill all required fields');
      return;
    }

    final request = InitiativeDocumentationRequest(
      whatWasAccomplished: whatWasAccomplishedController.text.trim(),
      startTime: startTimeController.text.trim(),
      endTime: endTimeController.text.trim(),
      whatDidYouLearn: whatDidYouLearnController.text.trim(),
    );

    EasyLoading.show(status: 'Saving document...');

    final success = await controller.saveInitiativeDocumentation(
      initiativeId,
      request,
    );

    EasyLoading.dismiss();

    if (success) {
      // Refresh progress overview data for graphs/charts
      final progressController = Get.find<ProgressOverviewController>();
      await progressController.fetchProgressOverviewData();
      Get.off(() => MyInitiativesScreen());
    }
  }
}
