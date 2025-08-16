import 'package:flutter/material.dart';
import 'package:tread256/core/common/widgets/shimmer_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BuildImage extends StatelessWidget {
  final String immagePath;

  const BuildImage({super.key, required this.immagePath});

  @override
  Widget build(BuildContext context) {
    if (immagePath.startsWith('http://') || immagePath.startsWith('https://')) {
      // Network image
      return CachedNetworkImage(
        imageUrl: immagePath,
        fit: BoxFit.cover,
        placeholder:
            (context, url) => const ShimmerCard(
              height: double.infinity,
              width: double.infinity,
            ),
        errorWidget:
            (context, url, error) => Container(
              color: Colors.grey[300],
              child: Icon(Icons.person, size: 40, color: Colors.grey[600]),
            ),
      );
    } else {
      // Asset image

      return ClipRRect(
        borderRadius: BorderRadius.circular(12), // Adjust radius as needed
        child: Container(
          color: Colors.grey[200], // Background color
          child: Image.asset(
            immagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: Icon(Icons.person, size: 40, color: Colors.grey[600]),
              );
            },
          ),
        ),
      );
    }
  }
}
