import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/core/utils/constants/image_path.dart';
import 'package:tread256/features/intentions/controller/intentions_controller.dart';
import 'package:tread256/features/intentions/widgets/form_fields.dart';
import 'package:tread256/features/intentions/widgets/header_section.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';

class AddNewIntentions extends StatelessWidget {
  AddNewIntentions({super.key});
  final AddIntentionsController controller = Get.put(AddIntentionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
          bottom: 40,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HeaderSection(
              //   headerText: "Add New Intentions",
              //   immagePath: "assets/images/component.png",
              //   boxHeight: 10,
              // ),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(ImagePath.icon),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Add New Intentions",
                      style: TextStyle(fontSize: 20, color: AppColors.primary),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32),

              buildUserSelectionField(
                controller: controller.personNameController,
                intentionController: controller,
                selectedUserId: controller.selectedUserId,
                searchResults: controller.searchResults,
                onUserSelected: (user) => controller.selectUser(user),
                label: 'Name:',
                hintText: 'Search for a person...',
              ),

              // User search results
              buildUserSearchResults(
                controller: controller,
                onUserSelected: (user) => controller.selectUser(user),
              ),

              SizedBox(height: 16),

              buildTextField(
                controller: controller.titleController,
                label: 'Title of Intention:',
                hintText: 'Title of Intention...',
              ),
              const SizedBox(height: 16),
              buildDropdown(
                label: 'Select Tree',
                hintText: 'Select Tree',
                selectedValue: controller.selectedTree,
                items: ['Personal', 'Everyday', 'Community'],
                onChanged: (newValue) {
                  if (newValue != null) {
                    controller.selectedTree.value = newValue;
                    controller.update();
                  }
                },
              ),
              const SizedBox(height: 16),
              buildDropdown(
                label: 'Categories',
                hintText: 'Select Category',
                selectedValue: controller.selectedCategory,
                items: [
                  'Encouragement',
                  'Support',
                  'Health & Fitness',
                  'Daily Routine',
                  'Volunteering',
                  'Mental Wellness',
                ],
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    controller.selectedCategory.value = newValue;
                    controller.update();
                  }
                },
              ),
              const SizedBox(height: 16),
              buildDateField(context, controller),
              const SizedBox(height: 16),
              buildTextField(
                controller: controller.relationshipController,
                label: 'Relationship',
                hintText: 'Type..',
              ),
              const SizedBox(height: 16),
              buildTextField(
                controller: controller.noteController,
                label: 'Note',
                hintText: 'Add Note... (Optional)',
                maxLines: 3,
              ),
              SizedBox(height: 32),
              CustomButtom(
                buttonText: "Save Intention",
                onPressed: () {
                  print("Button presseed");
                  controller.saveIntention();
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
