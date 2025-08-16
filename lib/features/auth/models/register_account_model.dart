import 'package:tread256/core/constent_models/groble_model.dart';

class RegisterAccountModel extends GrobleModel {
  const RegisterAccountModel(
    String? name,
    String? email,
    String? image,
    String? address,
    String? password,
  ) : super(
        name: name,
        email: email,
        image: image,
        address: address,
        password: password,
      );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'image': image,
      'address': address,
      'password': password,
    };
  }
}
