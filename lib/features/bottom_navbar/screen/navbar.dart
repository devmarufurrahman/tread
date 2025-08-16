import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/utils/constants/image_path.dart';
import 'package:tread256/features/bottom_navbar/controller/bottom_navbar_controller.dart';

class Navbar extends StatelessWidget {
  Navbar({super.key});
  final BottomNavbarController controller = Get.find<BottomNavbarController>();

  final List<String> icons = [
    ImagePath.home,
    ImagePath.intentions,
    ImagePath.inspiration,
    ImagePath.profile,
  ];

  final List<String> labels = ['Home', 'Intentions', 'Inspiration', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NavigationBarTheme(
        data: NavigationBarThemeData(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
            Set<WidgetState> states,
          ) {
            final isSelected = states.contains(WidgetState.selected);
            return TextStyle(
              color: isSelected ? const Color(0xFF57B396) : Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            );
          }),
        ),
        child: NavigationBar(
          indicatorColor: Colors.transparent,
          backgroundColor: Colors.white,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
          },
          destinations: List.generate(4, (index) {
            return NavigationDestination(
              icon: Image.asset(
                icons[index],
                color:
                    controller.selectedIndex.value == index
                        ? const Color(0xFF57B396)
                        : Colors.black,
                height: 24,
                width: 24,
              ),
              label: labels[index],
            );
          }),
        ),
      ),
    );
  }
}
