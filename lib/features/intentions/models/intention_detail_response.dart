import 'package:tread256/features/intentions/models/intentions_response.dart';

class IntentionDetailResponse {
  final String message;
  final dynamic error;
  final bool status;
  final IntentionDetailData data;
  final int statusCode;

  IntentionDetailResponse({
    required this.message,
    required this.error,
    required this.status,
    required this.data,
    required this.statusCode,
  });

  factory IntentionDetailResponse.fromJson(Map<String, dynamic> json) {
    return IntentionDetailResponse(
      message: json['message'] as String,
      error: json['error'],
      status: json['status'] as bool,
      data: IntentionDetailData.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as int,
    );
  }
}

class IntentionDetailData {
  final String id;
  final String titleOfIntention;
  final String relationship;
  final String selectTree;
  final String categories;
  final String date;
  final bool completedAction;
  final String? note;
  final UserInfo userInfo;
  final bool urlActive;

  IntentionDetailData({
    required this.id,
    required this.titleOfIntention,
    required this.relationship,
    required this.selectTree,
    required this.categories,
    required this.date,
    required this.completedAction,
    this.note,
    required this.userInfo,
    required this.urlActive,
  });

  factory IntentionDetailData.fromJson(Map<String, dynamic> json) {
    return IntentionDetailData(
      id: json['id'] as String? ?? '',
      titleOfIntention: json['title_of_intention'] as String? ?? '',
      relationship: json['relationship'] as String? ?? '',
      selectTree: json['select_tree'] as String? ?? '',
      categories: json['categories'] as String? ?? '',
      date: json['date'] as String? ?? '',
      completedAction: json['completed_action'] as bool? ?? false,
      note: json['note'] as String?,
      userInfo: UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
      urlActive: json['urlActive'] as bool? ?? false,
    );
  }
}
