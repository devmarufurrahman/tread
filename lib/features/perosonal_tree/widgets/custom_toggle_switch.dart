import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/perosonal_tree/controller/personal_tree_controller.dart';

class CustomToggleButton extends StatelessWidget {
  final PersonalTreeController controller;
  final String leftText;
  final String rightText;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final Color textActiveColor;
  final Color textInactiveColor;
  final double widthFactor;
  final double height;
  final double borderRadius;
  final double padding;
  final VoidCallback? onToggle;
  final RxBool? isActive;

  const CustomToggleButton({
    super.key,
    required this.controller,
    this.leftText = "View",
    this.rightText = "Close",
    this.backgroundColor = const Color(0xFFBBBBBB), // Colors.grey[300]
    this.activeColor = Colors.white,
    this.inactiveColor = const Color.fromARGB(
      255,
      118,
      116,
      116,
    ), // Colors.grey[500]
    this.textActiveColor = AppColors.primary,
    this.textInactiveColor = Colors.black,
    this.widthFactor = 0.3, // Approximate for width: 110 on a 360-width screen
    this.height = 46.0,
    this.borderRadius = 12.0,
    this.padding = 0.0,
    this.onToggle,
    this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final toggleWidth = screenWidth * widthFactor - padding;
    final sliderWidth = toggleWidth / 2 - padding / 4;

    final RxBool activeState = isActive ?? controller.showCompleted;

    return Obx(
      () => GestureDetector(
        onTap: () {
          if (onToggle != null) {
            onToggle!();
          } else {
            activeState.toggle();
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: padding / 2),
          height: height,
          width: toggleWidth,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                left:
                    activeState.value
                        ? padding / 4 + 2.5
                        : toggleWidth / 2 - padding / 4 - 2.5,
                top: 2.5,
                child: Container(
                  width: sliderWidth,
                  height: height - 5,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .15),
                        blurRadius:
                            2, // Increased blurRadius to match CustomToggleSwitch
                        offset: const Offset(0, 2),
                      ),
                    ],
                    color: activeState.value ? activeColor : inactiveColor,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        leftText,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color:
                              activeState.value
                                  ? textActiveColor
                                  : textInactiveColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        rightText,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color:
                              activeState.value
                                  ? textInactiveColor
                                  : textActiveColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
