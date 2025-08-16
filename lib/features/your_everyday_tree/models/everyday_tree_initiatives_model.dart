class EverydayTreeInitiativesResponse {
  final String message;
  final dynamic error;
  final bool status;
  final List<EverydayTreeInitiative> data;
  final int statusCode;

  EverydayTreeInitiativesResponse({
    required this.message,
    this.error,
    required this.status,
    required this.data,
    required this.statusCode,
  });

  factory EverydayTreeInitiativesResponse.fromJson(Map<String, dynamic> json) {
    return EverydayTreeInitiativesResponse(
      message: json['message'] ?? '',
      error: json['error'],
      status: json['status'] ?? false,
      data:
          (json['data'] as List?)
              ?.map((e) => EverydayTreeInitiative.fromJson(e))
              .toList() ??
          [],
      statusCode: json['statusCode'] ?? 0,
    );
  }
}

class EverydayTreeInitiative {
  final String id;
  final String everydayTreeCreatorId;
  final String categories;
  final String description;
  final bool complete;
  final ParticipantCount participantCount;
  final InitiativeDetails? initiativeDetails;
  final String createdAt;
  final String updatedAt;

  EverydayTreeInitiative({
    required this.id,
    required this.everydayTreeCreatorId,
    required this.categories,
    required this.description,
    required this.complete,
    required this.participantCount,
    this.initiativeDetails,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EverydayTreeInitiative.fromJson(Map<String, dynamic> json) {
    return EverydayTreeInitiative(
      id: json['id'] ?? '',
      everydayTreeCreatorId: json['everyday_tree_creatorid'] ?? '',
      categories: json['categories'] ?? '',
      description: json['description'] ?? '',
      complete: json['complete'] ?? false,
      participantCount: ParticipantCount.fromJson(json['_count'] ?? {}),
      initiativeDetails:
          json['initiative_details'] != null
              ? InitiativeDetails.fromJson(json['initiative_details'])
              : null,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'everyday_tree_creatorid': everydayTreeCreatorId,
      'categories': categories,
      'description': description,
      'complete': complete,
      '_count': participantCount.toJson(),
      'initiative_details': initiativeDetails?.toJson(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

class ParticipantCount {
  final int participants;

  ParticipantCount({required this.participants});

  factory ParticipantCount.fromJson(Map<String, dynamic> json) {
    return ParticipantCount(participants: json['participants'] ?? 0);
  }

  Map<String, dynamic> toJson() {
    return {'participants': participants};
  }
}

class InitiativeDetails {
  final String id;

  InitiativeDetails({required this.id});

  factory InitiativeDetails.fromJson(Map<String, dynamic> json) {
    return InitiativeDetails(id: json['id'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'id': id};
  }
}
