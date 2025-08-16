import 'package:flutter/material.dart';
import 'package:tread256/features/perosonal_tree/widgets/personal_tree_data.dart';
import 'package:tread256/features/perosonal_tree/widgets/section_header.dart';

class SuggestionsSeedsSection extends StatelessWidget {
  const SuggestionsSeedsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: "Suggestions Seeds"),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: PersonalTreeData(
                imagePath: "assets/icons/music.png",
                title: "For Jamie",
                boldText: "Send a playlist",
                subTitle: "Share music that reminds\nyou of them",
                buttonText1: "Mark Completed",
                buttonText2: "Revisit",
                onButton1Pressed: () {},
                onButton2Pressed: () {},
              ),
            ),
            Expanded(
              child: PersonalTreeData(
                imagePath: "assets/icons/note.png",
                title: "For Morgan",
                boldText: "Write a letter",
                subTitle: "Express gratitude in writing",
                buttonText1: "Mark Completed",
                buttonText2: "Revisit",
                onButton1Pressed: () {},
                onButton2Pressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
