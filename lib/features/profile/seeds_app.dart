import 'package:flutter/material.dart';
import 'package:tread256/core/utils/constants/image_path.dart';

class SeedsApp extends StatelessWidget {
  const SeedsApp({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 26),
                // Logo (centered)
                Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(ImagePath.component),
                  ),

                  // child: Container(
                  //   width: 80,
                  //   height: 80,
                  //   decoration: BoxDecoration(
                  //     color: const Color(0xFFE5F5EC),
                  //     shape: BoxShape.circle,
                  //     image: DecorationImage(image: AssetImage(ImagePath.icon)),
                  //   ),
                  // ),
                ),
                const SizedBox(height: 26),
                // Title
                Center(
                  child: const Text(
                    'Seeds App',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3CB371),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 16),
                // Subtitle/Description
                const Text(
                  'A place for you to ideate, track, and grow your intentionality through relationships, community, and the causes you care about. Activate your influence. Reach your world!',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
                const SizedBox(height: 18),
                // Paragraph
                const Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
                const SizedBox(height: 18),
                // Bulleted List
                const _BulletItem(
                  text:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                ),
                const SizedBox(height: 8),
                const _BulletItem(
                  text:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                ),
                const SizedBox(height: 8),
                const _BulletItem(
                  text:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BulletItem extends StatelessWidget {
  final String text;
  const _BulletItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('\u2022', style: TextStyle(fontSize: 18, height: 1.5)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
