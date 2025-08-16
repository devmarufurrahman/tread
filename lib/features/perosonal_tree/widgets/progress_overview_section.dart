import 'package:flutter/material.dart';
import 'package:tread256/features/perosonal_tree/widgets/personal_tree_data.dart';
import 'package:tread256/features/perosonal_tree/widgets/section_header.dart';

class ProgressOverviewSection extends StatelessWidget {
  const ProgressOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: "Progress Overview"),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: PersonalTreeData(
                imagePath: "assets/icons/growth.png",
                title: "Growth",
                boldText: "Tree Expanding",
                subTitle: "5 People 18 Actions",
              ),
            ),
            Expanded(
              child: PersonalTreeData(
                imagePath: "assets/icons/seak.png",
                title: "Streak",
                boldText: "4 weeks",
                subTitle: "Consistent engagement",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
