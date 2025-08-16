import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/your_community_tree/screen/all_serving_opportunities.dart';
import 'package:tread256/features/your_community_tree/screen/serve_details.dart';
import 'package:tread256/features/your_everyday_tree/screen/log_crate_and_details.dart';
import 'package:tread256/routes/app_routes.dart';
import 'package:tread256/core/utils/responsive.dart';

class YourCommunityTreeScreen extends StatelessWidget {
  const YourCommunityTreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final borderColor = Colors.teal.shade200;
    final iconColor = Colors.teal.shade200;
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(255, 244, 243, 243),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Organization Cards
          _buildCommunityCard(
            context: context,
            name: "Grace Community Church",
            desc:
                "Where food drives and youth mentorship sow seeds to serve all children.",
            iconPath: 'assets/icons/house.png',
            onTap: () {
              // Implementation needed
            },
          ),
          _buildCommunityCard(
            context: context,
            name: "Hope For All",
            desc:
                "Support Homeless And Meal Programs. Volunteer Or Donate (Saturdays).",
            iconPath: 'assets/icons/hand_icon.png',
            onTap: () {
              // Implementation needed
            },
          ),
          _buildCommunityCard(
            context: context,
            name: "Bright Future Fund",
            desc:
                "Scholarships And Tutoring For Local Students Get Involved Or Give.",
            iconPath: 'assets/icons/cape_icon.png',
            onTap: () {
              // Implementation needed
            },
          ),
          SizedBox(height: 20),
          // Recommend Opportunities title
          Center(
            child: Text(
              'Recommend Opportunities',
              style: TextStyle(
                color: Colors.teal.shade400,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 20),
          // Card for Food Drive
          Container(
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.teal.shade100,
                  child: Icon(Icons.food_bank, color: iconColor, size: 28),
                ),
                SizedBox(height: 10),
                Text(
                  'Food Drive',
                  style: TextStyle(
                    color: Colors.teal.shade800,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Grace Community Church',
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
                SizedBox(height: 3),
                Text(
                  'Saturday, 10:00 AM',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Get.to(() => AllServingOpportunities());
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: borderColor),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'See All',
                        style: getTextStyle(
                          color: AppColors.primary,
                          context: context,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(ServeDetailsScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade400,
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildCommunityCard({
    required BuildContext context,
    required String name,
    required String desc,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: Responsive.getResponsivePadding(
        context,
        horizontal: 18,
        vertical: 18,
      ),
      margin: EdgeInsets.only(
        bottom: Responsive.getResponsiveSpacing(context, 16),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF7FAFA),
        border: Border.all(color: Colors.teal.shade50),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.teal[50],
            child: Padding(
              padding: Responsive.getResponsivePadding(
                context,
                horizontal: 4,
                vertical: 4,
              ),
              child: Image.asset(
                iconPath,
                width: Responsive.getResponsiveWidth(context, 38),
                height: Responsive.getResponsiveHeight(context, 38),
              ),
            ),
          ),
          SizedBox(height: Responsive.getResponsiveSpacing(context, 14)),
          Text(
            name,
            style: getTextStyle(
              context: context,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          SizedBox(height: Responsive.getResponsiveSpacing(context, 8)),
          Text(
            desc,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: Responsive.getResponsiveFontSize(context, 17),
            ),
          ),
          SizedBox(height: Responsive.getResponsiveSpacing(context, 14)),
          Row(
            children: [
              OutlinedButton(
                onPressed: onTap,
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  foregroundColor: Colors.teal.shade400,
                  side: BorderSide(color: Colors.teal.shade400),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text("Serve", style: TextStyle(fontSize: 14)),
              ),
              SizedBox(width: 8),

              ElevatedButton(
                onPressed: () {
                  Get.to(LogCrateAndDetailsScreen());
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color:
                          AppColors
                              .primary, // Replace with your desired border color
                      // Adjust the border width as needed
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  "Log Service",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
