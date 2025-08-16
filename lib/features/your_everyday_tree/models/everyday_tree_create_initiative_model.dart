class CreateInitiativeRequest {
  final String categories;
  final String description;
  final List<String> participants;

  CreateInitiativeRequest({
    required this.categories,
    required this.description,
    required this.participants,
  });

  Map<String, dynamic> toJson() => {
    'categories': categories,
    'descreiption': description,
    'participants': participants,
  };
}

class CreateInitiativeResponse {
  final String message;
  final dynamic error;
  final bool status;
  final CreateInitiativeData? data;
  final int statusCode;

  CreateInitiativeResponse({
    required this.message,
    required this.error,
    required this.status,
    required this.data,
    required this.statusCode,
  });

  factory CreateInitiativeResponse.fromJson(Map<String, dynamic> json) {
    return CreateInitiativeResponse(
      message: json['message'],
      error: json['error'],
      status: json['status'],
      data:
          json['data'] != null
              ? CreateInitiativeData.fromJson(json['data'])
              : null,
      statusCode: json['statusCode'],
    );
  }
}

class CreateInitiativeData {
  final String id;
  final String everydayTreeCreatorId;
  final String categories;
  final String description;
  final bool complete;
  final String createdAt;
  final String updatedAt;

  CreateInitiativeData({
    required this.id,
    required this.everydayTreeCreatorId,
    required this.categories,
    required this.description,
    required this.complete,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CreateInitiativeData.fromJson(Map<String, dynamic> json) {
    return CreateInitiativeData(
      id: json['id'],
      everydayTreeCreatorId: json['everyday_tree_creatorid'],
      categories: json['categories'],
      description: json['description'],
      complete: json['complete'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class InitiativeDocumentationRequest {
  final String whatWasAccomplished;
  final String startTime;
  final String endTime;
  final String whatDidYouLearn;

  InitiativeDocumentationRequest({
    required this.whatWasAccomplished,
    required this.startTime,
    required this.endTime,
    required this.whatDidYouLearn,
  });

  Map<String, dynamic> toJson() {
    return {
      'what_was_accomplished': whatWasAccomplished,
      'start_time': startTime,
      'end_time': endTime,
      'what_did_you_learn': whatDidYouLearn,
    };
  }
}

class InitiativeDocumentationResponse {
  final String message;
  final dynamic error;
  final bool status;
  final String data;
  final int statusCode;

  InitiativeDocumentationResponse({
    required this.message,
    this.error,
    required this.status,
    required this.data,
    required this.statusCode,
  });

  factory InitiativeDocumentationResponse.fromJson(Map<String, dynamic> json) {
    return InitiativeDocumentationResponse(
      message: json['message'] ?? '',
      error: json['error'],
      status: json['status'] ?? false,
      data: json['data'] ?? '',
      statusCode: json['statusCode'] ?? 0,
    );
  }
}
