import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';
import 'package:tread256/features/your_everyday_tree/controller/my_initiatives_controller.dart';
import 'package:tread256/features/your_everyday_tree/widgets/everyday_tree_widgets.dart';

class CreateInitiative extends StatelessWidget {
  final MyInitiativesController controller =
      Get.find<MyInitiativesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              buildInitiativeHeader(),
              const SizedBox(height: 30),
              buildTitleField(controller: controller, context: context),
              const SizedBox(height: 14),
              buildDescriptionField(controller: controller),
              const SizedBox(height: 14),
              buildParticipantsSection(controller: controller),
              const SizedBox(height: 25),
              Obx(
                () => CustomButtom(
                  buttonText:
                      controller.isLoading.value
                          ? 'Creating...'
                          : 'Create Initiative',
                  onPressed:
                      controller.isLoading.value
                          ? null
                          : controller.submitNewInitiative,
                  vertical: 20,
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
