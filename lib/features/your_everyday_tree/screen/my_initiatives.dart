import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/your_everyday_tree/controller/my_initiatives_controller.dart';
import 'package:tread256/features/your_everyday_tree/screen/meal_train_tocumentation.dart';
import 'package:tread256/features/your_everyday_tree/screen/create_initiative.dart';
import 'package:tread256/features/your_everyday_tree/widgets/initiative_card.dart';
import 'package:tread256/core/common/widgets/shimmer_loading.dart';

class MyInitiativesScreen extends StatelessWidget {
  MyInitiativesScreen({super.key});
  final MyInitiativesController controller = Get.put(MyInitiativesController());

  String getCategoryIcon(String category) {
    switch (category.toUpperCase()) {
      case 'MEAL_TRAIN':
        return 'assets/icons/light_icon.png';
      case 'TIP_NIGHT':
        return 'assets/icons/frame_image1.png';
      default:
        return 'assets/icons/light_icon.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          final allCount = controller.initiatives.length;
          final LogCount =
              controller.initiatives
                  .where((i) => !i.complete && i.initiativeDetails == null)
                  .length;
          final completeCount =
              controller.initiatives
                  .where((i) => !i.complete && i.initiativeDetails != null)
                  .length;
          final completedCount =
              controller.initiatives.where((i) => i.complete).length;
          String label;
          int count;
          switch (controller.filter.value) {
            case 'Log':
              label = 'Log';
              count = LogCount;
              break;
            case 'Complete':
              label = 'Complete';
              count = completeCount;
              break;
            case 'Completed':
              label = 'Completed';
              count = completedCount;
              break;
            default:
              label = 'All';
              count = allCount;
          }
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "My Creative Initiatives",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$count',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          );
        }),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: AppColors.primary),
        ),
        actions: [
          PopupMenuButton<String>(
            color: AppColors.primary,
            icon: Icon(Icons.more_vert, color: AppColors.primary),
            onSelected: (value) => controller.filter.value = value,
            itemBuilder:
                (context) => [
                  PopupMenuItem(
                    value: 'All',
                    child: Text('All', style: TextStyle(color: Colors.white)),
                  ),
                  PopupMenuItem(
                    value: 'Log',
                    child: Text('Log', style: TextStyle(color: Colors.white)),
                  ),
                  PopupMenuItem(
                    value: 'Complete',
                    child: Text(
                      'Complete',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Completed',
                    child: Text(
                      'Completed',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
          ),
        ],
        backgroundColor: const Color(0xFFF6FAFF),
      ),
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF6FAFF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 0),

            // const SizedBox(height: 30),
            Obx(() {
              if (controller.isLoading.value) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .85,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return const ShimmerCard(
                        height: 120,
                        margin: EdgeInsets.only(bottom: 16),
                      );
                    },
                  ),
                );
              }

              final filtered =
                  controller.filter.value == 'All'
                      ? controller.initiatives
                      : controller.filter.value == 'Completed'
                      ? controller.initiatives.where((i) => i.complete).toList()
                      : controller.filter.value == 'Complete'
                      ? controller.initiatives
                          .where(
                            (i) => !i.complete && i.initiativeDetails != null,
                          )
                          .toList()
                      : controller.initiatives
                          .where(
                            (i) => !i.complete && i.initiativeDetails == null,
                          )
                          .toList();

              if (filtered.isEmpty) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inbox_outlined,
                          size: 48,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No creative initiatives found',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filtered.length,
                itemBuilder: (_, index) {
                  final initiative = filtered[index];
                  return GestureDetector(
                    onTap:
                        () => Get.to(
                          () => MealTrainDocumentationScreen(
                            initiativeId: initiative.id,
                          ),
                        ),
                    child: InitiativeCard(
                      icon: getCategoryIcon(initiative.categories),
                      title: initiative.categories.replaceAll('_', ' '),
                      description: initiative.description,
                      participants: initiative.participantCount.participants,
                      tagged: initiative.participantCount.participants,
                      status: controller.getButtonText(initiative),
                      complete: initiative.complete,
                      initiativeDetails: controller.isGotoThankPage(initiative),
                      iconvalue:
                          initiative.complete ? 'assets/icons/Frame.png' : null,
                      isSelected: initiative.complete,
                      initiativeId: initiative.id,
                      controller: controller,
                    ),
                  );
                },
              );
            }),
            const SizedBox(height: 12),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 36.0),
        child: FloatingActionButton(
          onPressed: () {
            Get.to(() => CreateInitiative());
          },
          backgroundColor: AppColors.primary,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
