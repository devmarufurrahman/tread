class PersonalTreeActionResponse {
  final String message;
  final dynamic error;
  final bool status;
  final PersonalTreeActionData data;
  final int statusCode;

  PersonalTreeActionResponse({
    required this.message,
    this.error,
    required this.status,
    required this.data,
    required this.statusCode,
  });

  factory PersonalTreeActionResponse.fromJson(Map<String, dynamic> json) {
    return PersonalTreeActionResponse(
      message: json['message'] as String,
      error: json['error'],
      status: json['status'] as bool,
      data: PersonalTreeActionData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
      statusCode: json['statusCode'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'error': error,
      'status': status,
      'data': data.toJson(),
      'statusCode': statusCode,
    };
  }
}

class PersonalTreeActionData {
  final Profile profile;
  final List<Action> actions;

  PersonalTreeActionData({required this.profile, required this.actions});

  factory PersonalTreeActionData.fromJson(Map<String, dynamic> json) {
    return PersonalTreeActionData(
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
      actions:
          (json['actions'] as List<dynamic>)
              .map((action) => Action.fromJson(action as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profile': profile.toJson(),
      'actions': actions.map((action) => action.toJson()).toList(),
    };
  }
}

class Action {
  final String actionMember;
  final String actionTitle;
  final String actionDescription;
  final String actionDate;
  final String actionTime;

  Action({
    required this.actionMember,
    required this.actionTitle,
    required this.actionDescription,
    required this.actionDate,
    required this.actionTime,
  });

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      actionMember: json['action_member'] as String,
      actionTitle: json['action_title'] as String,
      actionDescription: json['action_description'] as String,
      actionDate: json['action_date'] as String,
      actionTime: json['action_time'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'action_member': actionMember,
      'action_title': actionTitle,
      'action_description': actionDescription,
      'action_date': actionDate,
      'action_time': actionTime,
    };
  }
}

class Profile {
  final Friend friend;

  Profile({required this.friend});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      friend: Friend.fromJson(json['friend'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {'friend': friend.toJson()};
  }
}

class Friend {
  final FriendProfile profile;

  Friend({required this.profile});

  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(
      profile: FriendProfile.fromJson(json['profile'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {'profile': profile.toJson()};
  }
}

class FriendProfile {
  final String name;
  final String image;

  FriendProfile({required this.name, required this.image});

  factory FriendProfile.fromJson(Map<String, dynamic> json) {
    return FriendProfile(
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'image': image};
  }
}
