import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/core/common/styles/global_text_style.dart';
import 'package:tread256/core/common/styles/input_decoration.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/perosonal_tree/widgets/custom_button.dart';
import 'package:tread256/core/utils/responsive.dart';
import 'package:tread256/features/your_everyday_tree/api_services/log_api.dart';
import '../../perosonal_tree/widgets/custom_build_text_field.dart';
import '../controller/log_create_and_details_comtroller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tread256/core/common/widgets/shimmer_loading.dart';

class LogCrateAndDetailsScreen extends StatelessWidget {
  final LogCreateAndDetailsController controller = Get.put(
    LogCreateAndDetailsController(),
  );

  LogCrateAndDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Color(0xffF2F4F5),

            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.teal),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        title: const Text(
          'Log Crate And Details',
          style: TextStyle(
            color: Color(0xFF3CB496),
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Responsive.getResponsivePadding(context, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: Responsive.getResponsiveSpacing(context, 8)),
              Text(
                'Document Your Recent Contribution To Track\nAnd Celebrate Your Impact.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: Responsive.getResponsiveFontSize(context, 17),
                ),
              ),
              SizedBox(height: Responsive.getResponsiveSpacing(context, 16)),

              Container(
                decoration: BoxDecoration(
                  // color: const Color(0xFFF6FAF8),
                  color: Color(0xffF8F8F7),
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: Responsive.getResponsivePadding(
                  context,
                  vertical: 18,
                  horizontal: 14,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0x3357B396),
                      child: Image.asset(
                        "assets/icons/flage.png",
                        color: const Color(0xFF689F38),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Neighborhood garden",
                      style: getTextStyle(
                        context: context,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 9),
                    Text(
                      "start shared garden for your block",
                      style: getTextStyle(
                        context: context,
                        color: Color(0xFF535A6C),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              Text(
                'Log Details',
                style: getTextStyle(
                  context: context,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff535A6C),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'What Did You Do?',
                style: getTextStyle(
                  context: context,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff535A6C),
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: controller.whatDidYouDoController,
                maxLines: 4,
                decoration: CustomInputDecoration.customInputDecoration(
                  hintStyle: getTextStyle(
                    context: context,
                    color: Color(0x9E535A6C),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: 'Describe your activity)',
                ),
              ),

              const SizedBox(height: 16),
              Text(
                'Date',
                style: getTextStyle(
                  context: context,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff535A6C),
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: controller.dateController,
                readOnly: true,
                decoration: CustomInputDecoration.customInputDecoration(
                  hintStyle: getTextStyle(
                    context: context,
                    color: const Color(0x9E535A6C),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: 'MM-DD-YYYY',
                  suffixIcon: const Icon(
                    Icons.access_time,
                    color: Color(0xff535A6C),
                  ),
                ),
                onTap: () async {
                  // Trigger the date picker when the field is tapped
                  await controller.selectDate(context);
                },
              ),
              const SizedBox(height: 16),
              Text(
                'Tag Participants',
                style: getTextStyle(
                  context: context,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff535A6C),
                ),
              ),
              const SizedBox(height: 6),
              CustomBuildTextField(
                controller: controller.nameController,
                hintText: "Add names or emails",
                suffixIcon: const Icon(
                  Icons.group_outlined,
                  color: Colors.grey,
                ),
                onChanged: controller.onNameChanged,
                isLoading: controller.isLoading.value,
              ),
              Obx(() {
                if (controller.searchResults.isNotEmpty &&
                    controller.selectedUserId.value.isEmpty) {
                  print(
                    'Building search results list with ${controller.searchResults.length} items',
                  );
                  return Container(
                    margin: const EdgeInsets.only(top: 5),
                    constraints: const BoxConstraints(maxHeight: 200),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: controller.searchResults.length,
                      itemBuilder: (context, index) {
                        final user = controller.searchResults[index];
                        print(
                          'Building list item for user: ${user.profile.name}',
                        );
                        // controller.selectedUserId.value = user.id;
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              print('User tapped: ${user.profile.name}');
                              controller.selectUser(user);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    controller.selectedUserId.value == user.id
                                        ? Colors.blue.withOpacity(0.1)
                                        : Colors.transparent,
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    child: user.profile.image.isEmpty
                                        ? const Icon(Icons.person)
                                        : ClipOval(
                                            child: CachedNetworkImage(
                                              imageUrl: user.profile.image,
                                              width: 40,
                                              height: 40,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) => const ShimmerCircle(size: 40),
                                              errorWidget: (context, url, error) => const Icon(Icons.person),
                                            ),
                                          ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          user.profile.name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          user.email,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (controller.selectedUserId.value ==
                                      user.id)
                                    const Icon(
                                      Icons.check_circle,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),
              const SizedBox(height: 44),
              CustomButtom(
                buttonText: 'Save Log',
                onPressed: () {
                  // print("hello flutter");
                  submitActivity();
                },
                vertical: 20,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
