class Log {
  String message;
  dynamic error;
  bool status;
  Data data;
  int statusCode;

  Log({
    required this.message,
    required this.error,
    required this.status,
    required this.data,
    required this.statusCode,
  });

  factory Log.fromJson(Map<String, dynamic> json) {
    return Log(
      message: json['message'],
      error: json['error'],
      status: json['status'],
      data: Data.fromJson(json['data']),
      statusCode: json['statusCode'],
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

class Data {
  String id;
  String whatDidYouDo;
  DateTime date;
  List<Participant> participants;

  Data({
    required this.id,
    required this.whatDidYouDo,
    required this.date,
    required this.participants,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      whatDidYouDo: json['What_did_you_do'],
      date: DateTime.parse(json['date']),
      participants:
          (json['participants'] as List<dynamic>)
              .map((item) => Participant.fromJson(item))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'What_did_you_do': whatDidYouDo,
      'date': date.toIso8601String(),
      'participants': participants.map((p) => p.toJson()).toList(),
    };
  }
}

class Participant {
  String id;
  Profile profile;

  Participant({required this.id, required this.profile});

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['id'],
      profile: Profile.fromJson(json['profile']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'profile': profile.toJson()};
  }
}

class Profile {
  String name;

  Profile({required this.name});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
