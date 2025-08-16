import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/core/utils/constants/colors.dart';

class SaveLogScreen extends StatelessWidget {
  const SaveLogScreen({super.key});

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
          'Save Log',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            // Idea 1
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFF6FAF8),
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0x3357B396),
                    child: Image.asset(
                      ideas[0]['icon'] as String,
                      color: const Color(0xFF689F38),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    ideas[0]['title'] as String,
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
                    ideas[0]['subtitle'] as String,
                    style: getTextStyle(
                      context: context,
                      color: Color(0xFF535A6C),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Idea 2
          ],
        ),
      ),
    );
  }
}
