import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/profile_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tread256/core/common/widgets/shimmer_loading.dart';

class UpdateProfile extends StatelessWidget {
  final ProfileAllController profileController = Get.put(
    ProfileAllController(),
  );
  UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final data = profileController.editProfileData.value;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Obx(() {
                        final imageFile = profileController.imageFile.value;
                        return CircleAvatar(
                          radius: 38,
                          child:
                              imageFile != null
                                  ? ClipOval(
                                    child: Image.file(
                                      imageFile,
                                      width: 76,
                                      height: 76,
                                      fit: BoxFit.cover,
                                      errorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
                                        return Container(
                                          color: Colors.grey[300],
                                          child: Icon(
                                            Icons.person,
                                            size: 40,
                                            color: Colors.grey[600],
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                  : ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          data?.profile.image ??
                                          'https://randomuser.me/api/portraits/men/32.jpg',
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
                        );
                      }),
                      Positioned(
                        right: -5,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            profileController.showImageSourceDialog(context);
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
                  const SizedBox(height: 20),
                  Text(
                    data?.profile.name ?? 'No Name',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Growing Intentional Communities',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  const SizedBox(height: 32),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Name', style: _labelStyle),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: profileController.nameController,
                    decoration: _inputDecoration(hintText: 'Enter your name'),
                  ),
                  const SizedBox(height: 18),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Email Address', style: _labelStyle),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    readOnly: true,
                    controller: profileController.emailController,
                    decoration: _inputDecoration(
                      hintText: 'name@email.com',
                    ).copyWith(hintStyle: const TextStyle(color: Colors.grey)),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 18),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Address', style: _labelStyle),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: profileController.addressController,
                    decoration: _inputDecoration(
                      hintText: 'Enter your address',
                    ),
                  ),
                  const SizedBox(height: 18),

                  const SizedBox(height: 36),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Update',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {
                        profileController.updateProfile();
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const _labelStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  color: Colors.black87,
);

InputDecoration _inputDecoration({Widget? suffixIcon, String? hintText}) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey, width: 2),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.grey,
        style: BorderStyle.solid,
        width: 1,
      ),
    ),
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.red),
    suffixIcon: suffixIcon,
  );
}
