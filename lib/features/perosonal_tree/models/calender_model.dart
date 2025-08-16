class CalendarResponse {
  final String message;
  final dynamic error;
  final bool status;
  final List<DateTime> calendar;
  final int statusCode;

  CalendarResponse({
    required this.message,
    required this.error,
    required this.status,
    required this.calendar,
    required this.statusCode,
  });

  factory CalendarResponse.fromJson(Map<String, dynamic> json) {
    return CalendarResponse(
      message: json['message'],
      error: json['error'],
      status: json['status'],
      statusCode: json['statusCode'],
      calendar:
          (json['data']['calendar'] as List)
              .map((e) => DateTime.parse(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'error': error,
      'status': status,
      'statusCode': statusCode,
      'data': {'calendar': calendar.map((e) => e.toIso8601String()).toList()},
    };
  }
}
