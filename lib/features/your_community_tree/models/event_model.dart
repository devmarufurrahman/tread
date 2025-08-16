class Event {
  String eventName;
  String location;
  String serveDateAndTime;
  String address;
  String serveUserName;
  String serveUserEmail;
  String serveUserPhone;

  Event({
    required this.eventName,
    required this.location,
    required this.serveDateAndTime,
    required this.address,
    required this.serveUserName,
    required this.serveUserEmail,
    required this.serveUserPhone,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventName: json['event_name'],
      location: json['location'],
      serveDateAndTime: json['serve_date_and_time'],
      address: json['address'],
      serveUserName: json['serve_user_name'],
      serveUserEmail: json['serve_user_email'],
      serveUserPhone: json['serve_user_phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'event_name': eventName,
      'location': location,
      'serve_date_and_time': serveDateAndTime,
      'address': address,
      'serve_user_name': serveUserName,
      'serve_user_email': serveUserEmail,
      'serve_user_phone': serveUserPhone,
    };
  }
}
