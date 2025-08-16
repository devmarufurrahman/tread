import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tread256/features/your_everyday_tree/api_services/progress_overview_controller.dart';

class GraphsCharts extends StatelessWidget {
  const GraphsCharts({super.key});

  List<int> buildYAxisLabels(int maxValue) {
    // Build 6 labels: max, 4/5 max, 3/5 max, 2/5 max, 1/5 max, 0
    return List.generate(6, (i) => ((maxValue / 5) * (5 - i)).round());
  }

  int _getDynamicMaxValue(List<Map<String, dynamic>> data) {
    final max = data
        .map((e) => e['value'] as int)
        .fold(0, (a, b) => a > b ? a : b);
    if (max <= 0) return 10;
    // Round up to nearest even number or 5-multiple for better axis
    int rounded = ((max + 4) ~/ 5) * 5;
    return rounded < 10 ? 10 : rounded;
  }

  @override
  Widget build(BuildContext context) {
    final ProgressOverviewController controller = Get.put(
      ProgressOverviewController(),
    );
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Progress Overview',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xFF484C5A),
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 220,
              child: Obx(() {
                final data = controller.data;
                final hasData = data.any((item) => (item['value'] ?? 0) > 0);
                if (!hasData) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bar_chart,
                          size: 48,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'No progress data available',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  );
                }
                final maxValue = _getDynamicMaxValue(data);
                final yLabels = buildYAxisLabels(maxValue);
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Y-axis
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                          yLabels
                              .map(
                                (label) => Text(
                                  label.toString(),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                    const SizedBox(width: 16),
                    // Bars
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(data.length, (index) {
                            final item = data[index];
                            final double maxBarHeight = 140;
                            final double barHeight =
                                maxValue == 0
                                    ? 0
                                    : (item['value'] / maxValue) * maxBarHeight;
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AnimatedContainer(
                                  margin: EdgeInsets.only(right: 4),
                                  duration: const Duration(milliseconds: 500),
                                  width: 38,
                                  height: barHeight,
                                  decoration: BoxDecoration(
                                    color: item['color'],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  item['label'],
                                  style: const TextStyle(
                                    color: Color(0xFF484C5A),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
