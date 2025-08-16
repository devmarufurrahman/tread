// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/profile/controller/profile_controller.dart';
import 'package:tread256/features/profile/update_profile.dart';
import 'package:tread256/routes/app_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tread256/core/common/widgets/shimmer_loading.dart';
import 'package:tread256/features/friend_list/friend_list_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileAllController controller = Get.put(ProfileAllController());
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.profileData.value == null) {
          return Column(
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 16,
                ),
                child: Column(
                  children: const [
                    ShimmerCircle(size: 76),
                    SizedBox(height: 15),
                    ShimmerText(height: 24, width: 120),
                    SizedBox(height: 15),
                    ShimmerText(height: 18, width: 180),
                    SizedBox(height: 15),
                    ShimmerText(height: 16, width: 160),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: const [
                    Expanded(
                      child: ShimmerCard(height: 80, width: double.infinity),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: ShimmerCard(height: 80, width: double.infinity),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        final profileData = controller.profileData.value!;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Profile Header
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                color: Colors.white,
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 38,
                          child:
                              profileData.profile.image.isEmpty
                                  ? const Icon(Icons.person, size: 38)
                                  : ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl: profileData.profile.image,
                                      width: 76,
                                      height: 76,
                                      fit: BoxFit.cover,
                                      placeholder:
                                          (context, url) =>
                                              const ShimmerCircle(size: 76),
                                      errorWidget:
                                          (context, url, error) => const Icon(
                                            Icons.person,
                                            size: 38,
                                          ),
                                    ),
                                  ),
                        ),
                        if (profileData.profile.image.isEmpty)
                          const Positioned.fill(
                            child: Center(
                              child: Icon(Icons.error, color: Colors.red),
                            ),
                          ),

                        Positioned(
                          right: -5,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(UpdateProfile());
                            },
                            child: CircleAvatar(
                              radius: 13,
                              backgroundImage: AssetImage(
                                'assets/icons/edit.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    // Name
                    Text(
                      profileData.profile.name,
                      style: getTextStyle(
                        context: context,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff2C3E50),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Tagline as clickable link
                    Text(
                      'Growing Intentional Communities',
                      style: getTextStyle(
                        context: context,
                        fontSize: 18,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 15),
                    // Location with icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on, size: 20, color: Colors.teal),
                        SizedBox(width: 4),
                        Text(
                          profileData.profile.address,
                          style: getTextStyle(
                            context: context,
                            fontSize: 16,
                            color: const Color(0xff94A3B8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Stats Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        context: context,
                        icon: "assets/icons/frame_image2.png",
                        title: 'Actions',
                        count: '${profileData.actions} Completed',
                        subtitle: '', //Great Job Staying Active!
                      ),
                    ),
                    const SizedBox(width: 5),
                    Center(
                      child: Expanded(
                        child: _buildStatCard(
                          context: context,
                          icon: "assets/icons/frame_image1.png",
                          title: 'Creative Initiatives',
                          count: '${profileData.initiatives}  Active',
                          subtitle: '', //Staying Creative Initiatives Active!
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Options Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF8FAF9),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      _buildOptionTile(
                        context,
                        onTap: () {
                          Get.toNamed(AppRoute.getPrivacySecurityScreen());
                        },
                        'Privacy & Security',
                        showBlueDivider: true,
                      ),
                      _buildOptionTile(
                        context,
                        'About App',
                        showGreyDivider: true,
                        onTap: () {
                          Get.toNamed(AppRoute.getSeedsAppScreen());
                        },
                      ),

                      _buildOptionTile(
                        context,
                        'Help',
                        onTap: () {
                          Get.toNamed(
                            AppRoute.getFrequentlyAskedQuestionsScreen(),
                          );
                        },
                      ),

                      _buildOptionTile(
                        context,
                        onTap: () {
                          Get.to(() => FriendListScreen());
                        },
                        'See All Friends (Branches)',
                        showGreyDivider: true,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Log Out Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                  child: _buildOptionTile(
                    context,
                    onTap: () {
                      // Get.offAll(() => LoginScreen());

                      controller.logout();
                    },
                    'Log Out',
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      }),

      // Bottom Navigation Bar
    );
  }

  static Widget _buildStatCard({
    required BuildContext context,
    required String icon,
    required String title,
    required String count,
    required String subtitle,
  }) {
    return Card(
      elevation: 0,
      color: Color(0xffF8FAF9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        child: Column(
          children: [
            SizedBox(width: 48, height: 48, child: Image.asset(icon)),
            const SizedBox(height: 8),
            Text(
              title,
              style: getTextStyle(
                context: context,
                color: Color(0xFF535A6C),
                fontSize: 22,
                fontWeight: FontWeight.w800,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              count,
              style: getTextStyle(
                context: context,
                fontSize: 16,
                color: Color(0xff535A6C),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xff535A6C),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildOptionTile(
    BuildContext context,
    String title, {
    bool showBlueDivider = false,
    bool showGreyDivider = false,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF8FAF9),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: getTextStyle(
                context: context,
                color: Color(0xFF535A6C),
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: const Icon(
              Icons.chevron_right,
              color: Color(0xFFB0B8C1),
              size: 30,
            ),
            onTap: onTap,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            tileColor: Colors.transparent,
            dense: true,
          ),
          if (showBlueDivider)
            const Divider(
              thickness: 0.5,
              height: 10.0,
              indent: 0,
              endIndent: 0,
            ),
          if (showGreyDivider)
            const Divider(
              color: Color(0xFFE0E0E0),
              thickness: 1,
              height: 0,
              indent: 0,
              endIndent: 0,
            ),
        ],
      ),
    );
  }
}
