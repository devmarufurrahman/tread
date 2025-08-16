import 'package:flutter/material.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/inspiration/controller/inspiration_controller.dart';
import 'package:tread256/core/utils/responsive.dart';

class InspirationDetailPage extends StatelessWidget {
  final InspirationArticle article;

  const InspirationDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,

      body: ListView(
        children: [
          // Image
          ClipRRect(
            child: Image.asset(
              article.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Center(child: Text('Image not found')),
                  ),
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: Responsive.getResponsivePadding(context, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  article.title.replaceAll('\n', ' '),
                  style: TextStyle(
                    color: const Color(0xff535A6C),
                    fontSize: Responsive.getResponsiveFontSize(context, 26),
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                ),

                // Fast Description
                Text(
                  article.descriptionFast,
                  style: TextStyle(
                    color: const Color(0xff535A6C),
                    fontSize: Responsive.getResponsiveFontSize(context, 20),
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),

                // Long Description
                Text(
                  article.descriptionLong,
                  style: TextStyle(
                    color: const Color(0xff535A6C),
                    fontSize: Responsive.getResponsiveFontSize(context, 20),
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),

                // Sir1 (Formatted with preserved line breaks and spacing)
                _buildFormattedText(context, article.sir1),

                // Sir2 (Formatted with preserved line breaks and spacing)
                _buildFormattedText(context, article.sir2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to handle text with line breaks and emojis
  Widget _buildFormattedText(BuildContext context, String text) {
    // Split text by newlines to preserve intentional line breaks
    final lines =
        text.split('\n').where((line) => line.trim().isNotEmpty).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          lines.map((line) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: Responsive.getResponsiveSpacing(context, 8),
              ),
              child: Text(
                line.trim(),
                style: TextStyle(
                  color: const Color(0xff535A6C),
                  fontSize: Responsive.getResponsiveFontSize(context, 20),
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            );
          }).toList(),
    );
  }
}
