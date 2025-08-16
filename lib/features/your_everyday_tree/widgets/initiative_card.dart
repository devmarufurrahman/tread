import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/your_everyday_tree/screen/document_meal_train.dart';
import 'package:tread256/features/your_everyday_tree/screen/initiative_completed.dart';

class InitiativeCard extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final int participants;
  final int tagged;
  final String status;
  final String? iconvalue;
  final bool isSelected;
  final bool complete;
  final bool initiativeDetails;
  final String initiativeId;
  final dynamic controller;

  const InitiativeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.participants,
    required this.tagged,
    required this.status,
    this.iconvalue,
    this.isSelected = false,
    required this.initiativeId,
    required this.initiativeDetails,
    this.controller,
    required this.complete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFE6F2EF),
            radius: 28,
            backgroundImage: AssetImage(icon),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black87, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            'Participants: $participants tagged',
            style: const TextStyle(color: Colors.black54, fontSize: 13),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.transparent),
                  backgroundColor:
                      (complete || status == 'Completed')
                          ? Colors.green
                          : status == 'Complete'
                          ? AppColors.primary
                          : AppColors.info,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide.none,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                ),
                onPressed:
                    (complete || status == 'Completed')
                        ? null
                        : () async {
                          if (initiativeDetails) {
                            await controller.markAsCompleted(
                              initiativeId: initiativeId,
                            );
                            EasyLoading.show(status: "");
                            await controller.fetchInitiatives();
                            EasyLoading.dismiss();
                            Get.to(
                              () => InitiativeCompletedScreen(
                                initiativeId: initiativeId,
                              ),
                            );
                          } else {
                            Get.to(
                              () => DocumentMealTrainScreen(
                                initiativeId: initiativeId,
                              ),
                            );
                          }
                        },
                child: Row(
                  children: [
                    Text(
                      status == 'Complete'
                          ? 'Complete'
                          : status == 'Completed'
                          ? 'Completed'
                          : 'Log',
                      style: TextStyle(
                        color:
                            (complete || status == 'Completed')
                                ? Theme.of(context).colorScheme.onPrimary
                                : Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    isSelected == true
                        ? Image.asset(
                          iconvalue ?? 'assets/icons/Frame.png',
                          width: 20,
                          height: 20,
                          color: AppColors.primary,
                        )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: Colors.teal),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                ),
                onPressed: () {
                  if (controller != null) {
                    controller.shareInitiative(
                      title: title,
                      description: description,
                      participants: participants,
                      status: status,
                      initiativeId: initiativeId,
                    );
                  }
                },
                child: const Text('Share'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
