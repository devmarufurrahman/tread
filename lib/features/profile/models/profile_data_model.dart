class ProfileData {
  final Profile profile;
  final int actions;
  final int initiatives;

  ProfileData({
    required this.profile,
    required this.actions,
    required this.initiatives,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      profile: Profile.fromJson(json['profile']),
      actions: json['actions'],
      initiatives: json['initiatives'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profile': profile.toJson(),
      'actions': actions,
      'initiatives': initiatives,
    };
  }
}

class Profile {
  final String name;
  final String image;
  final String address;

  Profile({required this.name, required this.image, required this.address});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      image: json['image'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'image': image, 'address': address};
  }
}
