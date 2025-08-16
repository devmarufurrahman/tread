import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/auth/controler/add_organizations_controller.dart';
import 'package:tread256/features/bottom_navbar/screen/bottom_navbar_screen.dart';
import 'package:tread256/core/utils/responsive.dart';

class AddOrganizationsScreen extends StatelessWidget {
  AddOrganizationsScreen({super.key});

  final AddOrganizationsController controller = Get.put(
    AddOrganizationsController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Organizations',
          style: getTextStyle(context: context, color: Color(0xff535A6C)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.to(BottomNavbarScreen());
            },
            child: Text(
              'Skip',
              style: getTextStyle(context: context, color: Color(0xFF4CB28B)),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              Text(
                'Plant Your Trees',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              Text(
                'Add friends, family, and organizations\n\nto your Trees to begin',
                textAlign: TextAlign.center,
                style: getTextStyle(
                  context: context,
                  color: Color(0xff666666),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              // Search bar
              TextField(
                controller: controller.searchController,
                decoration: InputDecoration(
                  hintText: 'Search organizations',
                  hintStyle: const TextStyle(
                    color: Color(0xFFADAEBC),
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFFF3F4F6),

                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color(0xFFE5E7EB),
                    ), // Border color #E5E7EB
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color(0xFFE5E7EB),
                    ), // Border color when enabled
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color(0xFFE5E7EB),
                    ), // Border color when focused
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Organization list
              Expanded(
                child: Obx(
                  () => ListView.separated(
                    itemCount: controller.filteredOrganizations.length,
                    separatorBuilder:
                        (_, __) => SizedBox(
                          height: Responsive.getResponsiveSpacing(context, 12),
                        ),
                    itemBuilder: (context, index) {
                      final org = controller.filteredOrganizations[index];

                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE0E0E0)),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding: Responsive.getResponsivePadding(
                          context,
                          horizontal: 12,
                          vertical: 12,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                // Leading icon
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF3F4F6),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    org.icon,
                                    color: const Color(0xFF4CB28B),
                                    size: 32,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ), // Spacing between icon and text
                                // Title text
                                Expanded(
                                  child: Text(
                                    org.name,
                                    style: getTextStyle(
                                      context: context,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: const Color(0xff535A6C),
                                    ),
                                  ),
                                ),

                                // Add button
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 18,
                                      horizontal: 26,
                                    ),
                                    backgroundColor:
                                        org.added
                                            ? Colors.grey
                                            : const Color(0xFF4CB28B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    // minimumSize: const Size(60, 36),
                                  ),
                                  onPressed: () => controller.toggleAdd(index),
                                  child: Text(
                                    org.added ? 'Added' : 'Add',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            // ElevatedButton(
                            //   onPressed: () {
                            //     // print("Clicked");
                            //     Get.bottomSheet(
                            //       isDismissible: false,
                            //       Container(
                            //         decoration: BoxDecoration(
                            //           color: Colors.amber,
                            //         ),
                            //         child: SingleChildScrollView(
                            //           child: Column(
                            //             mainAxisSize: MainAxisSize.min,
                            //             children: [
                            //               ListTile(
                            //                 leading: Icon(Icons.light_mode),
                            //                 title: Text("Light Mode"),
                            //                 onTap: () {
                            //                   Get.changeTheme(
                            //                     ThemeData.light(),
                            //                   );
                            //                 },
                            //               ),
                            //               ListTile(
                            //                 leading: Icon(Icons.dark_mode),
                            //                 title: Text("Dark Mode"),
                            //                 onTap: () {
                            //                   Get.changeTheme(ThemeData.dark());
                            //                 },
                            //               ),
                            //               ElevatedButton.icon(
                            //                 onPressed: () {
                            //                   Get.back();
                            //                 },
                            //                 label: Text("data"),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     );
                            //   },
                            //   child: Text("Click"),
                            // ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFF4CB28B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Get.to(BottomNavbarScreen());
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
