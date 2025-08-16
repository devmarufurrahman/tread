import 'package:tread256/features/perosonal_tree/models/user_search_model.dart';

class BranchSearchResponse {
  final String message;
  final dynamic error;
  final bool status;
  final List<BranchData> data;
  final int statusCode;

  BranchSearchResponse({
    required this.message,
    this.error,
    required this.status,
    required this.data,
    required this.statusCode,
  });

  factory BranchSearchResponse.fromJson(Map<String, dynamic> json) {
    return BranchSearchResponse(
      message: json['message'] ?? '',
      error: json['error'],
      status: json['status'] ?? false,
      data:
          (json['data'] as List?)
              ?.map((e) => BranchData.fromJson(e))
              .toList() ??
          [],
      statusCode: json['statusCode'] ?? 0,
    );
  }
}

class BranchData {
  final UserData friend;

  BranchData({required this.friend});

  factory BranchData.fromJson(Map<String, dynamic> json) {
    return BranchData(friend: UserData.fromJson(json['friend'] ?? {}));
  }

  Map<String, dynamic> toJson() {
    return {'friend': friend.toJson()};
  }
}
