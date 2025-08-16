import 'package:flutter/material.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tread256/core/common/widgets/shimmer_loading.dart';

Widget buildProfileHeader({
  required String? profileName,
  required String? profileImage,
  required int count,
  required bool isCompleted,
  String? fallbackName,
}) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary, width: 3.0),
        ),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey.shade200,
          child:
              profileImage == null || profileImage.isEmpty
                  ? const Icon(Icons.person, size: 60)
                  : ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: profileImage,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      placeholder:
                          (context, url) => const ShimmerCircle(size: 120),
                      errorWidget:
                          (context, url, error) =>
                              const Icon(Icons.person, size: 60),
                    ),
                  ),
        ),
      ),
      const SizedBox(height: 5),
      Text(
        profileName ?? fallbackName ?? '',
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      // const SizedBox(height: 10),
      Text(
        isCompleted ? "$count Completed" : "$count Pending",
        style: TextStyle(
          color: isCompleted ? Colors.green : Colors.orange,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}
