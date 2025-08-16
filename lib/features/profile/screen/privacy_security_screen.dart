import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart'; // Import for text styles
import 'package:tread256/core/utils/constants/colors.dart'; // Import for colors
import 'privacy_security_controller.dart'; // Import the controller

class PrivacySecurityScreen extends StatelessWidget {
  const PrivacySecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final PrivacySecurityController controller = Get.put(
      PrivacySecurityController(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy & Security',
          style: getTextStyle(
            context: context,
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color:
                AppColors.primary, // Assuming primary color for app bar title
          ),
        ),
        backgroundColor: Colors.white, // Assuming white background for app bar
        elevation: 0, // Removing shadow
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primary,
          ), // Back button
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Security Settings Section
              // Text(
              //   'Security Settings',
              //   style: getTextStyle(
              //     context: context,
              //     fontSize: 20,
              //     fontWeight: FontWeight.w500,
              //     color:
              //         AppColors
              //             .primary, // Assuming primary color for section title
              //   ),
              // ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Color(
                    0xffF8FAF9,
                  ), // Assuming background color for section
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    // Two-Factor Authentication Tile
                    // _buildSettingsTile(
                    //   context: context,
                    //   title: 'Two-Factor Authentication',
                    //   subtitle:
                    //       'Add an extra layer of security to your account',
                    //   value: controller.twoFactorEnabled,
                    //   onChanged: (bool newValue) {
                    //     controller.updateToggle(
                    //       'twoFactor',
                    //       newValue,
                    //     ); // Call the single update function
                    //   },
                    // ),
                    // const Divider(color: Color(0xFFE0E0E0)), // Divider
                    // // Biometric Login Tile
                    // _buildSettingsTile(
                    //   context: context,
                    //   title: 'Biometric Login',
                    //   subtitle: 'Use fingerprint or face recognition to login',
                    //   value: controller.biometricLoginEnabled,
                    //   onChanged: (bool newValue) {
                    //     controller.updateToggle(
                    //       'biometric',
                    //       newValue,
                    //     ); // Call the single update function
                    //   },
                    // ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Privacy Settings Section
              Text(
                'Notifications Settings',
                style: getTextStyle(
                  context: context,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color:
                      AppColors
                          .primary, // Assuming primary color for section title
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Color(
                    0xffF8FAF9,
                  ), // Assuming background color for section
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    // Push Notifications Tile
                    _buildSettingsTile(
                      context: context,
                      title: 'Push Notifications',
                      subtitle: 'Receive notifications about important updates',
                      value: controller.pushNotificationsEnabled,
                      onChanged: (bool newValue) {
                        controller.updateToggle(
                          'pushNotifications',
                          newValue,
                        ); // Call the single update function
                      },
                    ),
                    // const Divider(color: Color(0xFFE0E0E0)), // Divider
                    // Location Services Tile
                    // _buildSettingsTile(
                    //   context: context,
                    //   title: 'Location Services',
                    //   subtitle: 'Allow app to access your location',
                    //   value: controller.locationServicesEnabled,
                    //   onChanged: (bool newValue) {
                    //     controller.updateToggle(
                    //       'locationServices',
                    //       newValue,
                    //     ); // Call the single update function
                    //   },
                    // ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Data Collection Section
              Text(
                'Data Collection',
                style: getTextStyle(
                  context: context,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color:
                      AppColors
                          .primary, // Assuming primary color for section title
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Color(
                    0xffF8FAF9,
                  ), // Assuming background color for section
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    // Analytics Tile
                    _buildSettingsTile(
                      context: context,
                      title: 'Analytics',
                      subtitle: 'Help improve the app by sharing usage data',
                      value: controller.analyticsEnabled,
                      onChanged: (bool newValue) {
                        controller.updateToggle(
                          'analytics',
                          newValue,
                        ); // Call the single update function
                      },
                    ),
                    const Divider(color: Color(0xFFE0E0E0)), // Divider
                    // Marketing Communications Tile
                    _buildSettingsTile(
                      context: context,
                      title: 'Marketing Communications',
                      subtitle:
                          'Receive updates about new features and\n\npromotions',
                      value: controller.marketingCommunicationsEnabled,
                      onChanged: (bool newValue) {
                        controller.updateToggle(
                          'marketingCommunications',
                          newValue,
                        ); // Call the single update function
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30), // Space before buttons
              // Save Changes Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle save changes - access controller values here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.primary, // Assuming primary color for button
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        8,
                      ), // Assuming rounded corners
                    ),
                  ),
                  child: Text(
                    'Save Changes',
                    style: getTextStyle(
                      context: context,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // Assuming white text color
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15), // Space between buttons
              // Reset to Defaults Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    // Handle reset to defaults - access controller methods here
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor:
                        AppColors.primary, // Assuming primary color for text
                    side: BorderSide(
                      color: AppColors.primary,
                    ), // Assuming primary color for border
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        8,
                      ), // Assuming rounded corners
                    ),
                  ),
                  child: Text(
                    'Reset to Defaults',
                    style: getTextStyle(
                      context: context,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable widget for settings tiles
  Widget _buildSettingsTile({
    required BuildContext context,
    required String title,
    required String subtitle,
    required RxBool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: getTextStyle(
                  context: context,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF535A6C),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                subtitle,
                style: getTextStyle(
                  context: context,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF94A3B8),
                ),
              ),
            ],
          ),
        ),
        // Wrap Switch with Obx to make it reactive
        Obx(
          () => Switch(
            value: value.value,
            onChanged: onChanged,
            activeColor:
                AppColors.primary, // Assuming primary color for active toggle
          ),
        ),
      ],
    );
  }
}
