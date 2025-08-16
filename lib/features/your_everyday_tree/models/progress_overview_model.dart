class ProgressOverviewResponse {
  final String message;
  final dynamic error;
  final bool status;
  final List<ProgressOverviewData> data;
  final int statusCode;

  ProgressOverviewResponse({
    required this.message,
    this.error,
    required this.status,
    required this.data,
    required this.statusCode,
  });

  factory ProgressOverviewResponse.fromJson(Map<String, dynamic> json) {
    return ProgressOverviewResponse(
      message: json['message'] ?? '',
      error: json['error'],
      status: json['status'] ?? false,
      data:
          (json['data'] as List?)
              ?.map((e) => ProgressOverviewData.fromJson(e))
              .toList() ??
          [],
      statusCode: json['statusCode'] ?? 0,
    );
  }
}

class ProgressOverviewData {
  final DateTime fullTime;
  final int count;

  ProgressOverviewData({required this.fullTime, required this.count});

  factory ProgressOverviewData.fromJson(Map<String, dynamic> json) {
    return ProgressOverviewData(
      fullTime: DateTime.parse(json['fullTime']).toLocal(),
      count: json['count'] ?? 0,
    );
  }

  String get dayLabel {
    // Returns 3-letter day label (e.g., MON, TUE)
    const days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    return days[fullTime.weekday % 7];
  }
}
