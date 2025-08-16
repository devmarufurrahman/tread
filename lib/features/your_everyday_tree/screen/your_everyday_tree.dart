import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/features/your_everyday_tree/widgets/graphs_charts.dart';
import 'package:tread256/features/your_everyday_tree/controller/your_everyday_tree_controller.dart';
import 'package:tread256/features/your_everyday_tree/screen/ideas_library.dart';
import 'package:tread256/features/your_everyday_tree/screen/my_initiatives.dart';

// ignore: must_be_immutable
class YourEverydayTreeScreen extends StatelessWidget {
  YourEverydayTreeController yourEverydayTreeController = Get.put(
    YourEverydayTreeController(),
  );
  YourEverydayTreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(255, 244, 243, 243),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          // Tree Image
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // Get.to(() => InitiativeCompletedScreen());
                    Get.to(() => MyInitiativesScreen());
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xffF2F4F5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 26.5, // 59x59 px
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            'assets/icons/hand_icon.png',
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "My Initiatives",
                          style: getTextStyle(
                            context: context,
                            color: Color(0xff535A6C),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    // Get.to(() => MyInitiativesScreen());
                    Get.to(() => IdeasLibraryScreen());
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xffF2F4F5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 26.5, // 59x59 px
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            'assets/icons/light_icon.png',
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Ideas library",
                          style: getTextStyle(
                            context: context,
                            color: Color(0xff535A6C),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Text(
            "Progress overview",
            style: getTextStyle(
              context: context,
              color: Color(0xff57B396),
              fontWeight: FontWeight.w400,
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),

          Text(
            "Track your impact and see how your\n\n creative initiatives contribute to the community.",
            style: getTextStyle(
              context: context,
              color: Color(0xff535A6C),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 28),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Your Activity",
              style: getTextStyle(
                context: context,
                color: Color(0xff57B396),
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 24),
          Obx(
            () => EveryDayTreeActivityCard(
              imagePath: "assets/icons/frame_image2.png",
              states: "Completed",
              countvalue:
                  "${yourEverydayTreeController.initiatives} Creative Initiatives",
              description:
                  "You've completed ${yourEverydayTreeController.initiatives} community creative initiatives this year.",
            ),
          ),
          SizedBox(height: 24),
          Obx(
            () => EveryDayTreeActivityCard(
              imagePath: "assets/icons/group_icon.png",
              states: "People Impacted",
              countvalue: "${yourEverydayTreeController.people_impacted} +",
              description:
                  "Your efforts have reached over ${yourEverydayTreeController.reachOverPeople} people.",
            ),
          ),
          SizedBox(height: 24),
          Obx(
            () => EveryDayTreeActivityCard(
              states: "Hours Volunteered",
              countvalue:
                  "${yourEverydayTreeController.hours_volunteered} Hours",
              description: "Total time you've dedicated to community work.",
            ),
          ),
          SizedBox(height: 24),

          GraphsCharts(),
        ],
      ),
    );
  }
}

class EveryDayTreeActivityCard extends StatelessWidget {
  final String? imagePath;
  final String? states;
  final String? countvalue;
  final String? description;
  const EveryDayTreeActivityCard({
    super.key,
    this.imagePath,
    this.states,
    this.countvalue,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 160,
      decoration: BoxDecoration(
        color: Color(0xffF2F4F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 15, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25.5, // 59x59 px
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(
                imagePath ?? 'assets/icons/hand_icon.png',
              ),
            ),
            SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  states ?? "Completed",
                  style: getTextStyle(
                    context: context,
                    color: Color(0xff535A6C),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  countvalue ?? "0 Initiatives",
                  style: getTextStyle(
                    context: context,
                    color: Color(0xff111111),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 17),
                Text(
                  description ??
                      "You've completed 0 community creative initiatives this year.",
                  style: getTextStyle(
                    context: context,
                    color: Color(0xff535A6C),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
