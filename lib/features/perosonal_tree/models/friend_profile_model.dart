class FriendProfileResponse {
  final String message;
  final dynamic error;
  final bool status;
  final FriendProfileData data;
  final int statusCode;

  FriendProfileResponse({
    required this.message,
    this.error,
    required this.status,
    required this.data,
    required this.statusCode,
  });

  factory FriendProfileResponse.fromJson(Map<String, dynamic> json) {
    return FriendProfileResponse(
      message: json['message'],
      error: json['error'],
      status: json['status'],
      data: FriendProfileData.fromJson(json['data']),
      statusCode: json['statusCode'],
    );
  }
}

class FriendProfileData {
  final Profile profile;
  final List<Action> actions;

  FriendProfileData({required this.profile, required this.actions});

  factory FriendProfileData.fromJson(Map<String, dynamic> json) {
    return FriendProfileData(
      profile: Profile.fromJson(json['profile']),
      actions:
          (json['actions'] as List)
              .map((action) => Action.fromJson(action))
              .toList(),
    );
  }
}

class Profile {
  final Friend friend;

  Profile({required this.friend});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(friend: Friend.fromJson(json['friend']));
  }
}

class Friend {
  final FriendProfile profile;

  Friend({required this.profile});

  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(profile: FriendProfile.fromJson(json['profile']));
  }
}

class FriendProfile {
  final String name;
  final String image;

  FriendProfile({required this.name, required this.image});

  factory FriendProfile.fromJson(Map<String, dynamic> json) {
    return FriendProfile(name: json['name'], image: json['image']);
  }
}

class Action {
  final String id;
  final String actionCreator;
  final String actionMember;
  final String actionTitle;
  final String actionDescription;
  final String actionDate;
  final String actionTime;
  final String fullDateTime;
  final bool completed;
  final String createdAt;
  final String updatedAt;

  Action({
    required this.id,
    required this.actionCreator,
    required this.actionMember,
    required this.actionTitle,
    required this.actionDescription,
    required this.actionDate,
    required this.actionTime,
    required this.fullDateTime,
    required this.completed,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      id: json['id'] ?? '',
      actionCreator: json['action_creator'] ?? '',
      actionMember: json['action_member'] ?? '',
      actionTitle: json['action_title'] ?? '',
      actionDescription: json['action_description'] ?? '',
      actionDate: json['action_date'] ?? '',
      actionTime: json['action_time'] ?? '',
      fullDateTime: json['fulldatetime'] ?? '',
      completed: json['completed'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}
