class IntentionsResponse {
  final String message;
  final dynamic error;
  final bool status;
  final List<IntentionData> data;
  final int statusCode;

  IntentionsResponse({
    required this.message,
    required this.error,
    required this.status,
    required this.data,
    required this.statusCode,
  });

  factory IntentionsResponse.fromJson(Map<String, dynamic> json) {
    return IntentionsResponse(
      message: json['message'] as String,
      error: json['error'],
      status: json['status'] as bool,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => IntentionData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      statusCode: json['statusCode'] as int,
    );
  }
}

class IntentionData {
  final String id;
  final UserInfo userInfo;
  final String titleOfIntention;
  final String selectTree;
  final String categories;
  final String date;
  final bool completedAction;

  IntentionData({
    required this.id,
    required this.userInfo,
    required this.titleOfIntention,
    required this.selectTree,
    required this.categories,
    required this.date,
    required this.completedAction,
  });

  factory IntentionData.fromJson(Map<String, dynamic> json) {
    return IntentionData(
      id: json['id'] as String? ?? '',
      userInfo: UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
      titleOfIntention: json['title_of_intention'] as String? ?? '',
      selectTree: json['select_tree'] as String? ?? '',
      categories: json['categories'] as String? ?? '',
      date: json['date'] as String? ?? '',
      completedAction: json['completed_action'] as bool? ?? false,
    );
  }
}

class UserInfo {
  final String id;
  final String name;
  final String image;
  final String? relationship;

  UserInfo({
    required this.id,
    required this.name,
    required this.image,
    this.relationship,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      relationship: json['relationship'] as String?,
    );
  }
}
