import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/core/utils/constants/image_path.dart';
import 'package:tread256/features/inspiration/screen/inspiration_detail_page.dart';
import '../controller/inspiration_controller.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

class Nspiration extends StatelessWidget {
  const Nspiration({super.key});

  @override
  Widget build(BuildContext context) {
    final InspirationController controller = Get.put(InspirationController());

    return Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          // Logo and Title
          const SizedBox(height: 34),
          Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(ImagePath.icon),
              ),
              const SizedBox(height: 12),
              Text(
                'Seeds Inspiration',
                style: getTextStyle(
                  context: context,
                  color: AppColors.primary,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
          // Articles
          Obx(
            () => Column(
              children:
                  controller.articles.map((article) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: Colors.white,
                      elevation: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            child: Image.asset(
                              article.imageUrl,
                              height: 170,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              article.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff535A6C),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8,
                            ),
                            child: Row(
                              children: [
                                // Read More Button
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => InspirationDetailPage(
                                              article: article,
                                              // description: articled,
                                            ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0,
                                      vertical: 8.0,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Text(
                                      'Read More',
                                      style: TextStyle(
                                        color: AppColors.primaryBackground,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // Share Button
                                GestureDetector(
                                  onTap: () async {
                                    // Load image from assets
                                    final byteData = await rootBundle.load(
                                      article.imageUrl,
                                    );

                                    // Create a temporary file
                                    final tempDir =
                                        await getTemporaryDirectory();
                                    final file =
                                        await File(
                                          '${tempDir.path}/shared_image.png',
                                        ).create();
                                    await file.writeAsBytes(
                                      byteData.buffer.asUint8List(),
                                    );

                                    // Share image and title
                                    await Share.shareXFiles(
                                      [XFile(file.path)],
                                      text: article.title,
                                      subject: 'Check out this inspiration!',
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 36.0,
                                      vertical: 10.0,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: AppColors.primary,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'Share',
                                      style: getTextStyle(
                                        context: context,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 8),
                        ],
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
