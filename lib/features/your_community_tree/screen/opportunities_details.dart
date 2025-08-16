import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/core/utils/constants/image_path.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';
import 'package:tread256/features/your_community_tree/screen/all_serving_opportunities.dart';

class OpportunitiesDetailsScreen extends StatelessWidget {
  const OpportunitiesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              children: [
                const SizedBox(height: 16),
                // Circle Icon
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6F4EA),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(ImagePath.component),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Thank You!
                Text(
                  'Thank You!',
                  style: getTextStyle(
                    context: context,
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 12),
                // Subtitle
                Text(
                  "You're signed up to serve at the Food Drive.",
                  textAlign: TextAlign.center,
                  style: getTextStyle(
                    context: context,
                    fontSize: 16,
                    color: Color(0xff535A6C),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 24),
                // Event Details
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Event Details:',
                    style: getTextStyle(
                      context: context,
                      fontSize: 18,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Details List
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• Event: Food Drive',
                        style: getTextStyle(
                          context: context,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff535A6C),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        '• Location: Grace Community Church',
                        style: getTextStyle(
                          context: context,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff535A6C),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        '• Date & Time: Saturday, 8:00 AM – 11:00\n\n\n AM (Morning Shift)',
                        style: getTextStyle(
                          context: context,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff535A6C),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        '• Address: 123 Main St, Springfield',
                        style: getTextStyle(
                          context: context,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff535A6C),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // What's Next?
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "What's Next?",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• You\'ll receive a confirmation email with\n\n\n details and reminders.',
                        style: getTextStyle(
                          context: context,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff535A6C),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        '• Please arrive 10 minutes early.',
                        style: getTextStyle(
                          context: context,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff535A6C),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),

                // Back To Serve Button
                CustomButtom(
                  horizontal: 70,
                  isPadding: true,
                  buttonText: 'Back To Serve',
                  onPressed: () {
                    Get.to(() => AllServingOpportunities());
                  },
                  vertical: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
