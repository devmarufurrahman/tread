class EditProfileData {
  final String email;
  final Profile profile;

  EditProfileData({required this.email, required this.profile});

  factory EditProfileData.fromJson(Map<String, dynamic> json) {
    return EditProfileData(
      email: json['email'],
      profile: Profile.fromJson(json['profile']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'profile': profile.toJson()};
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
