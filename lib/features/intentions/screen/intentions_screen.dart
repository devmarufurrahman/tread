import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/intentions/controller/intentions_controller.dart';
import 'package:tread256/features/intentions/screen/add_new_intentions.dart';
import 'package:tread256/features/intentions/widgets/intention_list.dart';

import '../../../core/utils/constants/image_path.dart';

class IntentionsScreen extends StatelessWidget {
  IntentionsScreen({super.key});
  final AddIntentionsController controller = Get.put(AddIntentionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshIntention();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
              bottom: 10,
            ),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HeaderSection(
                //   headerText: 'My Intentions',
                //   immagePath: ImagePath.icon,
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
                      SizedBox(height: 5),
                      Text(
                        "My Intentions List",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 20),
                // Text(
                //   "Intentions List",
                //   style: TextStyle(fontSize: 22, color: AppColors.primary),
                // ),
                const SizedBox(height: 10),
                IntentionList(controller: controller),
                const SizedBox(height: 10),

                // CustomButtom(
                //   buttonText: "New Intention",
                //   onPressed: () {
                //     Get.to(() => AddNewIntentions());
                //   },
                // ),
                SizedBox(height: 20),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 36.0, right: 10),
        child: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddNewIntentions());
          },
          backgroundColor: AppColors.primary,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
