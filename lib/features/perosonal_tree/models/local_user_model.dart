import 'dart:typed_data';

import 'package:flutter_contacts/contact.dart';

class LocalUserModel {
  final String name;
  final String phoneNumber;
  final String? image; // For API: URL string
  final Uint8List? photoBytes; // For local contact photos

  LocalUserModel({
    required this.name,
    required this.phoneNumber,
    this.image,
    this.photoBytes,
  });

  // Factory for API data
  factory LocalUserModel.fromJson(Map<String, dynamic> json) {
    return LocalUserModel(
      name: json['name'] ?? '',
      phoneNumber: json['phone'] ?? '',
      image: json['image_url'], // Adjust based on your API response
    );
  }

  // Factory for local contacts
  factory LocalUserModel.fromContact(Contact contact) {
    return LocalUserModel(
      name: contact.displayName,
      phoneNumber: contact.phones.isNotEmpty ? contact.phones.first.number : '',
      photoBytes: contact.photo,
    );
  }
}
