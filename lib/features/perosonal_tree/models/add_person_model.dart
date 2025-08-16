class AddPersonRequest {
  final String friendId;
  final String relationship;

  AddPersonRequest({required this.friendId, required this.relationship});

  Map<String, dynamic> toJson() {
    return {'friend_id': friendId, 'relationship': relationship};
  }
}

class AddPersonResponse {
  final String message;
  final dynamic error;
  final bool status;
  final int statusCode;

  AddPersonResponse({
    required this.message,
    this.error,
    required this.status,
    required this.statusCode,
  });

  factory AddPersonResponse.fromJson(Map<String, dynamic> json) {
    return AddPersonResponse(
      message: json['message'] ?? '',
      error: json['error'],
      status: json['status'] ?? false,
      statusCode: json['statusCode'] ?? 0,
    );
  }
}
