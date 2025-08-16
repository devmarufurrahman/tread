class InitiativeDetailsResponse {
  final String message;
  final dynamic error;
  final bool status;
  final InitiativeDetailsData data;
  final int statusCode;

  InitiativeDetailsResponse({
    required this.message,
    this.error,
    required this.status,
    required this.data,
    required this.statusCode,
  });

  factory InitiativeDetailsResponse.fromJson(Map<String, dynamic> json) {
    return InitiativeDetailsResponse(
      message: json['message'] ?? '',
      error: json['error'],
      status: json['status'] ?? false,
      data: InitiativeDetailsData.fromJson(json['data'] ?? {}),
      statusCode: json['statusCode'] ?? 0,
    );
  }
}

class InitiativeDetailsData {
  final String id;
  final String everydayTreeCreatorId;
  final String categories;
  final InitiativeDetailsInfo initiativeDetails;
  final List<Participant> participants;

  InitiativeDetailsData({
    required this.id,
    required this.everydayTreeCreatorId,
    required this.categories,
    required this.initiativeDetails,
    required this.participants,
  });

  factory InitiativeDetailsData.fromJson(Map<String, dynamic> json) {
    return InitiativeDetailsData(
      id: json['id'] ?? '',
      everydayTreeCreatorId: json['everyday_tree_creatorid'] ?? '',
      categories: json['categories'] ?? '',
      initiativeDetails: InitiativeDetailsInfo.fromJson(
        json['initiative_details'] ?? {},
      ),
      participants:
          (json['participants'] as List?)
              ?.map((e) => Participant.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class InitiativeDetailsInfo {
  final String id;
  final String initiativeId;
  final String whatWasAccomplished;
  final String startTime;
  final String endTime;
  final String whatDidYouLearn;
  final bool saveDocumentPublic;

  InitiativeDetailsInfo({
    required this.id,
    required this.initiativeId,
    required this.whatWasAccomplished,
    required this.startTime,
    required this.endTime,
    required this.whatDidYouLearn,
    required this.saveDocumentPublic,
  });

  factory InitiativeDetailsInfo.fromJson(Map<String, dynamic> json) {
    return InitiativeDetailsInfo(
      id: json['id'] ?? '',
      initiativeId: json['initiative_id'] ?? '',
      whatWasAccomplished: json['what_was_accomplished'] ?? '',
      startTime: json['start_time'] ?? '',
      endTime: json['end_time'] ?? '',
      whatDidYouLearn: json['what_did_you_learn'] ?? '',
      saveDocumentPublic: json['save_document_public'] ?? false,
    );
  }
}

class Participant {
  final Profile profile;

  Participant({required this.profile});

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(profile: Profile.fromJson(json['profile'] ?? {}));
  }
}

class Profile {
  final String name;

  Profile({required this.name});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(name: json['name'] ?? '');
  }
}
