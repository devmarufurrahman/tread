// lib/features/perosonal_tree/widgets/section_header.dart
import 'package:flutter/material.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: getTextStyle(
          context: context,
          color: Color(0xff57B396),
          fontWeight: FontWeight.w400,
          fontSize: 28,
        ),
      ),
    );
  }
}
