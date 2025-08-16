class UserSearchResponse {
  final String message;
  final dynamic error;
  final bool status;
  final List<UserData> data;
  final int statusCode;

  UserSearchResponse({
    required this.message,
    this.error,
    required this.status,
    required this.data,
    required this.statusCode,
  });

  factory UserSearchResponse.fromJson(Map<String, dynamic> json) {
    return UserSearchResponse(
      message: json['message'] ?? '',
      error: json['error'],
      status: json['status'] ?? false,
      data:
          (json['data'] as List?)?.map((e) => UserData.fromJson(e)).toList() ??
          [],
      statusCode: json['statusCode'] ?? 0,
    );
  }
}

class UserData {
  final String id;
  final String email;
  final UserProfile profile;
  final String? relationship;
  final String? tag;

  UserData({
    required this.id,
    required this.email,
    required this.profile,
    this.relationship,
    this.tag,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      profile: UserProfile.fromJson(json['profile'] ?? {}),
      relationship: json['relationship'],
      tag: json['tag'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'profile': profile.toJson(),
      'relationship': relationship,
      'tag': tag,
    };
  }
}

class UserProfile {
  final String name;
  final String image;

  UserProfile({required this.name, required this.image});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(name: json['name'] ?? '', image: json['image'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'image': image};
  }
}
