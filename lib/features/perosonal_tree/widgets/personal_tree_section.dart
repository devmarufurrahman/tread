import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/perosonal_tree/controller/personal_tree_controller.dart';
import 'package:tread256/features/perosonal_tree/widgets/personal_tree_data.dart';
import 'package:tread256/features/perosonal_tree/widgets/show_branches_dialog.dart';
import 'package:tread256/features/perosonal_tree/widgets/show_new_connection_dialog.dart';

class PersonalTreeSection extends StatelessWidget {
  final PersonalTreeController controller;

  const PersonalTreeSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      await showDialog(
                        // barrierColor: Colors.purple,
                        barrierDismissible: false,
                        context: context,
                        builder:
                            (context) =>
                                ShowNewConnectionDialog(controller: controller),
                      );
                    },
                    child: PersonalTreeData(
                      imagePath: "assets/icons/add.png",
                      title: "Add New Branches",
                      boldText: "New connection",
                      subTitle: "Add a person to your circle",
                    ),
                  ),
                ),

                //
                Expanded(
                  child: Obx(
                    () => PersonalTreeData(
                      imagePath: "assets/icons/rightsign.png",
                      title: "Actions ",
                      boldText:
                          "${controller.actionCompleteCount.value} Completed",
                      subTitle: "Great Jov staying Active! ",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Row(
            //   children: [
            //     Expanded(
            //       child: InkWell(
            //         onTap: () async {
            //           await showDialog(
            //             barrierDismissible: false,
            //             context: context,
            //             builder:
            //                 (context) =>
            //                     ShowBranchesDialog(controller: controller),
            //           );
            //         },
            //         child: Obx(
            //           () => PersonalTreeData(
            //             imagePath: "assets/icons/map.png",
            //             title: "New Branches",
            //             boldText: "${controller.getTotalFriend.value} Added",
            //             subTitle: "New People joined ",
            //           ),
            //         ),
            //       ),
            //     ),

            //     Expanded(
            //       child: Obx(
            //         () => PersonalTreeData(
            //           imagePath: "assets/icons/rightsign.png",
            //           title: "Actions ",
            //           boldText:
            //               "${controller.actionCompleteCount.value} Completed",
            //           subTitle: "Great Jov staying Active! ",
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ],
    );
  }
}
