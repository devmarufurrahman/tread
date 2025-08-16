import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/intentions/controller/intentions_controller.dart';
import 'package:tread256/features/intentions/screen/intentions_overview.dart';
import 'package:tread256/features/intentions/widgets/header_section.dart';

class IntentionList extends StatelessWidget {
  final AddIntentionsController controller;

  const IntentionList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.intentionData.isEmpty ) {
        return buildEmptyState();
      }

      // Filter intentions based on filter value
      final filtered =
          controller.filter.value == 'All'
              ? controller.intentionData
              : controller.filter.value == 'Completed'
              ? controller.intentionData
                  .where((i) => i.completedAction)
                  .toList()
              : controller.intentionData
                  .where((i) => !i.completedAction)
                  .toList();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(() {
                int selectedCount=0;
                switch (controller.filter.value) {
                  case 'Completed':
                    selectedCount =
                        controller.intentionData
                            .where((i) => i.completedAction)
                            .length;
                    break;
                  case 'Incompleted':
                    selectedCount =
                        controller.intentionData
                            .where((i) => !i.completedAction)
                            .length;
                    break;
                  default:
                    selectedCount = controller.intentionData.length;
                }
            
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: .1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.primary),
                      ),
                      child: Text(
                        '$selectedCount',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    PopupMenuButton<String>(
                      icon: Icon(
                        Icons.filter_list,
                        color: AppColors.primary,
                        size: 30,
                      ),
                      color: AppColors.primary,
                      onSelected: (value) => controller.filter.value = value,
                      itemBuilder:
                          (context) => [
                            PopupMenuItem(
                              value: 'All',
                              child: Text(
                                'All',
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
                            PopupMenuItem(
                              value: 'Incompleted',
                              child: Text(
                                'Incompleted',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            
                          ],
                    ),
                  ],
                );
              }),
            ],
          ),
        
          (filtered.isEmpty)
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Text(
                      controller.filter.value == 'Completed'
                          ? 'You have no completed intentions yet.'
                          : controller.filter.value == 'Incompleted'
                              ? 'You have no incomplete intentions.'
                              : "You don't have any intentions set right now, add a new intention to get started on watering your trees and watching your relationships grow!",
                      style: TextStyle(fontSize: 15, color: AppColors.info),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final intention = filtered[index];
                    return buildIntentionListItem(intention);
                  },
                ),
        ],
      );
    });
  }

  Widget buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text(
            "You don't have any intentions set right now, add a new intention to get started on watering your trees and watching your relationships grow!",
            style: TextStyle(fontSize: 15, color: AppColors.info),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget buildIntentionListItem(dynamic intention) {
    final displayDate =
        DateTime.tryParse(
          intention.date,
        )?.let((dt) => DateFormat('yyyy-MM-dd').format(dt)) ??
        'No Date';

    return GestureDetector(
      onTap: () {
        Get.to(() => IntentionsOverview(), arguments: intention);
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                HeaderSection(
                  headerText: '',
                  immagePath: intention.userInfo.image,
                  boxHeight: 0,
                ),
                Text(
                  intention.selectTree,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Call with ${intention.userInfo.name}",
                  style: TextStyle(color: AppColors.textPrimary, fontSize: 14),
                ),
                SizedBox(height: 5),
                buildIntentionDetails(intention, displayDate),
              ],
            ),
          ),
          buildRightIcon(intention: intention),
        ],
      ),
    );
  }

  Widget buildIntentionDetails(dynamic intention, String displayDate) {
    var title = intention.titleOfIntention;
    var categoriesText = intention.categories;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title.length > 15 ? title.substring(0, 15) + "..." : title,
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
        ),
        buildDotSeparator(),
        Text(
          categoriesText.length > 10
              ? categoriesText.substring(0, 8) + ".."
              : categoriesText,
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
        ),
        buildDotSeparator(),
        Text(
          displayDate,
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
        ),
      ],
    );
  }

  Widget buildDotSeparator() {
    return Row(
      children: [
        const SizedBox(width: 2),
        Container(
          height: 5,
          width: 5,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        const SizedBox(width: 2),
      ],
    );
  }

  Widget buildRightIcon({dynamic intention}) {
    return Positioned(
      right: 10,
      top: 10,
      child: Image.asset(
        intention.completedAction
            ? 'assets/icons/right.png'
            : 'assets/icons/right2.png',
        height: !intention.completedAction ? 30 : 40,
        width: !intention.completedAction ? 30 : 40,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
      ),
    );
  }
}

extension DateTimeExtension on DateTime {
  T? let<T>(T Function(DateTime) transform) => transform(this);
}
