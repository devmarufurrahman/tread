import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/your_everyday_tree/controller/initiative_details_controller.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/your_everyday_tree/widgets/documentation_widgets.dart';
import 'package:tread256/core/common/widgets/shimmer_loading.dart';

class MealTrainDocumentationScreen extends StatelessWidget {
  final String initiativeId;
  const MealTrainDocumentationScreen({super.key, required this.initiativeId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InitiativeDetailsController());

    // Fetch data when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchInitiativeDetails(initiativeId);
    });

    return Scaffold(
      appBar: buildDocumentationHeader(title: 'Initiative Documentation'),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Shimmer for subtitle
                  const ShimmerText(height: 20, width: double.infinity),
                  const SizedBox(height: 20),
                  // Shimmer for summary card
                  const ShimmerCard(
                    height: 100,
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  // Shimmer for participants section
                  const ShimmerText(height: 16, width: 150),
                  const SizedBox(height: 10),
                  const ShimmerCard(
                    height: 60,
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  // Shimmer for time section
                  const ShimmerCard(
                    height: 40,
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                  // Shimmer for learnings section
                  const ShimmerText(height: 16, width: 120),
                  const SizedBox(height: 10),
                  const ShimmerCard(
                    height: 80,
                    margin: EdgeInsets.only(bottom: 20),
                  ),
                ],
              ),
            );
          }

          if (controller.errorMessage.value.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 48, color: Colors.red),
                  SizedBox(height: 16),
                  Text(
                    'Error: ${controller.errorMessage.value}',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed:
                        () => controller.fetchInitiativeDetails(initiativeId),
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }

          final details = controller.initiativeDetails.value;
          if (details == null) {
            return Center(
              child: Text('No data available', style: TextStyle(fontSize: 16)),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                buildDocumentationSubtitle(
                  subtitle:
                      'Review the details and impact of your\n documented initiative below.',
                ),
                const SizedBox(height: 18),
                buildDocumentationSummaryCard(
                  summary: details.initiativeDetails.whatWasAccomplished,
                ),
                const SizedBox(height: 22),
                const Text(
                  'Participants & Tags',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xff535A6C),
                  ),
                ),
                const SizedBox(height: 10),
                buildDocumentationParticipantsRow(
                  participants:
                      details.participants.isNotEmpty
                          ? details.participants
                              .map((p) => p.profile.name)
                              .join(', ')
                          : '',
                ),
                const SizedBox(height: 8),
                const Divider(height: 24, thickness: 1),
                buildDocumentationTimeRow(
                  timeRange: _formatTimeRange(
                    details.initiativeDetails.startTime,
                    details.initiativeDetails.endTime,
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(height: 24, thickness: 1),
                buildDocumentationLearningsSection(
                  learnings: details.initiativeDetails.whatDidYouLearn,
                ),
                const SizedBox(height: 30),
                buildDocumentationReturnButton(),
                const SizedBox(height: 16),
              ],
            ),
          );
        }),
      ),
    );
  }

  String _formatTimeRange(String startTime, String endTime) {
    try {
      final start = DateTime.parse(startTime);
      final end = DateTime.parse(endTime);
      final duration = end.difference(start);
      final hours = duration.inHours;
      final minutes = duration.inMinutes % 60;

      final startFormatted =
          '${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')}';
      final endFormatted =
          '${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}';

      return '$hours hours $minutes minutes ($startFormatted - $endFormatted)';
    } catch (e) {
      return 'Time information unavailable';
    }
  }
}
