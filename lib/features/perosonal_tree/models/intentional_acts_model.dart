class IntentionalActsResponse {
  final String message;
  final dynamic error;
  final bool status;
  final List<IntentionalAct> data;
  final int statusCode;

  IntentionalActsResponse({
    required this.message,
    this.error,
    required this.status,
    required this.data,
    required this.statusCode,
  });

  factory IntentionalActsResponse.fromJson(Map<String, dynamic> json) {
    return IntentionalActsResponse(
      message: json['message'] ?? '',
      error: json['error'],
      status: json['status'] ?? false,
      data:
          (json['data'] as List?)
              ?.map((e) => IntentionalAct.fromJson(e))
              .toList() ??
          [],
      statusCode: json['statusCode'] ?? 0,
    );
  }
}

class IntentionalAct {
  final String id;
  final String userId;
  final String userName;
  final String userImage;
  final String actionTitle;
  final bool actionCompleted;

  IntentionalAct({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.actionTitle,
    required this.actionCompleted,
  });

  factory IntentionalAct.fromJson(Map<String, dynamic> json) {
    return IntentionalAct(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      userName: json['userName'] ?? '',
      userImage: json['userImage'] ?? '',
      actionTitle: json['actionTitle'] ?? '',
      actionCompleted: json['actionCompleted'] ?? false,
    );
  }
}
