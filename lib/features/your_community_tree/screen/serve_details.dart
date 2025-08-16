import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/core/common/styles/input_decoration.dart';
import 'package:tread256/core/utils/constants/colors.dart' show AppColors;
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';
import 'package:tread256/features/your_community_tree/controller/event_serve_controller.dart';

class ServeDetailsScreen extends StatelessWidget {
  final EventServeController controller = Get.put(EventServeController());
  ServeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xFF6EC6B2);
    Color borderColor = Color(0xFFB2DFDB);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Color(0xffF2F4F5),

            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.teal),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
        title: Text(
          'Opportunities Details',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w400,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 24),
            Image.asset("assets/icons/food_drive.png", width: 52, height: 52),
            SizedBox(height: 12),
            Text(
              "Food Drive",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Grace Community Church",
              style: getTextStyle(
                context: context,
                color: Color(0xff535A6C),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 53),
            Text(
              "Sign Up",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 16),

            TextFormField(
              controller: controller.serveUserNameController,
              decoration: CustomInputDecoration.customInputDecoration(
                isSuffixIcon: true,
                hintStyle: getTextStyle(
                  context: context,
                  color: Color(0x9E535A6C),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                hintText: 'Enter name',
                suffixIcon: Icon(Icons.person_outline),
              ),
            ),

            SizedBox(height: 12),

            TextFormField(
              controller: controller.serveUserEmailController,
              decoration: CustomInputDecoration.customInputDecoration(
                isSuffixIcon: true,
                hintStyle: getTextStyle(
                  context: context,
                  color: Color(0x9E535A6C),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                hintText: 'Enter email',
                suffixIcon: Icon(Icons.email),
              ),
            ),

            SizedBox(height: 12),
            TextFormField(
              controller: controller.serveUserPhoneController,
              keyboardType: TextInputType.phone,
              decoration: CustomInputDecoration.customInputDecoration(
                isSuffixIcon: true,
                hintStyle: getTextStyle(
                  context: context,
                  color: Color(0x9E535A6C),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                hintText: 'Enter number',
                suffixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Obx(
                  () => _buildShiftCard(
                    title: "Morning",
                    time: "Sat, 10:00 AM - 2:00 PM",
                    selected: controller.selectedShift.value == 0,
                    onTap: () => controller.selectShift(0),
                    mainColor: mainColor,
                    borderColor: borderColor,
                  ),
                ),
                SizedBox(width: 12),
                Obx(
                  () => _buildShiftCard(
                    title: "Afternoon",
                    time: "Sat, 2:00 PM - 6:00 PM",
                    selected: controller.selectedShift.value == 1,
                    onTap: () => controller.selectShift(1),
                    mainColor: mainColor,
                    borderColor: borderColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: CustomButtom(
                horizontal: 70,
                isPadding: true,
                buttonText: 'Sign Up For Serve',
                onPressed: () {
                  // print("hello flutter");
                  controller.signUpForServe();
                },
                vertical: 20,
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildShiftCard({
    required String title,
    required String time,
    required bool selected,
    required VoidCallback onTap,
    required Color mainColor,
    required Color borderColor,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: selected ? Colors.white : const Color(0xFFF5F5F5),
            border: Border.all(
              color:
                  selected
                      ? const Color(0xff57B396).withValues(alpha: 0.5)
                      : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Icon(Icons.ac_unit, color: mainColor, size: 28),
              const SizedBox(height: 6),
              Text(
                title,
                style: TextStyle(
                  color: mainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
