class LogCreateModel {
  final String whatDidYouDo;
  final String date;
  final List<String> participants;

  LogCreateModel({
    required this.whatDidYouDo,
    required this.date,
    required this.participants,
  });

  // Factory constructor to create an instance from JSON
  factory LogCreateModel.fromJson(Map<String, dynamic> json) {
    return LogCreateModel(
      whatDidYouDo: json['what_did_you_do'] as String,
      date: json['date'] as String,
      participants: List<String>.from(json['participants'] as List),
    );
  }

  // Method to convert instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'what_did_you_do': whatDidYouDo,
      'date': date,
      'participants': participants,
    };
  }
}
