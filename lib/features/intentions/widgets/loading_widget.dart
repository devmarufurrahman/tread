import 'package:flutter/material.dart';
import 'package:tread256/core/common/widgets/shimmer_loading.dart';

Widget buildLoadingWidget() {
  return Scaffold(
    body: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 100),
          // Shimmer for header
          const ShimmerCard(height: 60, margin: EdgeInsets.only(bottom: 20)),
          // Shimmer for content cards
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const ShimmerCard(
                  height: 120,
                  margin: EdgeInsets.only(bottom: 16),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
