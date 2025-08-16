// lib/features/perosonal_tree/widgets/personal_tree_data.dart
import 'package:flutter/material.dart';
import 'package:tread256/core/utils/constants/colors.dart';

class PersonalTreeData extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? boldText;
  final String? subTitle;
  final String? buttonText1;
  final String? buttonText2;
  final VoidCallback? onButton1Pressed; // Added for button actions
  final VoidCallback? onButton2Pressed;

  const PersonalTreeData({
    super.key,
    required this.imagePath,
    required this.title,
    required this.boldText,
    required this.subTitle,
    this.buttonText1,
    this.buttonText2,
    this.onButton1Pressed,
    this.onButton2Pressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage:
                imagePath != null
                    ? AssetImage(imagePath!)
                    : const AssetImage('assets/icons/default_profile.png'),
          ),
          const SizedBox(height: 10),
          Text(
            title ?? "",
            style: const TextStyle(fontSize: 15, color: Colors.grey),
          ),
          const SizedBox(height: 5),
          Text(
            boldText ?? "",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            subTitle ?? "",
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),

          buttonText1 != null || buttonText2 != null
              ? Padding(
                padding: const EdgeInsets.only(top: 10, left: 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (buttonText1 != null)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: BorderSide.none,
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 5,
                            ),
                          ),
                          onPressed: onButton1Pressed ?? () {},
                          child: Text(
                            buttonText1!,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      SizedBox(width: 10),
                      if (buttonText2 != null)
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                          onPressed: onButton2Pressed ?? () {},
                          child: Text(
                            buttonText2!,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              )
              : const SizedBox.shrink(), // Use SizedBox.shrink when no buttons
        ],
      ),
    );
  }
}
