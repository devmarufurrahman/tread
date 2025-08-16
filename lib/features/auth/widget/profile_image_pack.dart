import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/colors.dart';

import '../controler/create_account_controller.dart';

class ProfileImagePack extends StatelessWidget {
  const ProfileImagePack({super.key, required this.controller});

  final CreateAccountController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        GestureDetector(
          onTap: controller.showImagePickerOptions,
          child: Obx(
            () => CircleAvatar(
              radius: 40,
              backgroundColor: const Color(0x1A57B396),
              backgroundImage:
                  controller.profileImage.value != null
                      ? FileImage(controller.profileImage.value!)
                      : null,
              child:
                  controller.profileImage.value == null
                      ? const Icon(
                        Icons.person,
                        size: 60,
                        color: Color(0xffB4DBFF),
                      )
                      : null,
            ),
          ),
        ),
        GestureDetector(
          onTap: controller.showImagePickerOptions,
          child: CircleAvatar(
            radius: 14,
            backgroundColor: AppColors.primary,
            child: const Icon(Icons.edit, size: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
