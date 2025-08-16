import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/your_everyday_tree/screen/log_edit_and_details.dart';

import 'log_crate_and_details.dart';

class IdeasLibraryScreen extends StatelessWidget {
  const IdeasLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ideas = [
      {
        'icon': "assets/icons/flage.png",
        'iconBg': Color(0xFFE2F3EC),
        'title': 'Neighborhood garden',
        'subtitle': 'start shared garden for your block',
        "status": "inactive",
      },
      {
        'icon': "assets/icons/park_clean_up.png",
        'iconBg': Color(0xFFE2F3EC),
        'title': 'Park Clean up',
        'subtitle': 'Organize a group to clean up a local park.',
        "status": "active",
      },
      {
        'icon': "assets/icons/books.png",
        'iconBg': Color(0xFFE2F3EC),
        'title': 'Book Drive',
        'subtitle': 'collect and donate to local schools',
        "status": "inactive",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Color(0xffF2F4F5),

            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.teal),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        title: Text(
          'Ideas Library',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w400,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: ideas.length,
        separatorBuilder: (_, __) => const SizedBox(height: 18),
        itemBuilder: (context, i) {
          final idea = ideas[i];
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF6FAF8),
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0x3357B396),
                  child: Image.asset(
                    idea['icon'] as String,
                    color: const Color(0xFF689F38),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  idea['title'] as String,
                  style: getTextStyle(
                    context: context,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 9),
                Text(
                  idea['subtitle'] as String,
                  style: getTextStyle(
                    context: context,
                    color: Color(0xFF535A6C),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 118,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2CB58D),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      idea['status'] == 'active'
                          ? Get.to(() => LogEditAndDetails())
                          : Get.to(() => LogCrateAndDetailsScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Log',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        if (idea['status'] == 'active') ...[
                          const SizedBox(width: 4),
                          Image.asset(
                            'assets/icons/edit_image.png',
                            color: Colors.white,
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
