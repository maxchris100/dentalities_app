import 'dart:convert';

import '../../domain/entities/user.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.iat,
      // required super.firstName,
      // required super.lastName,
      required super.email,
      required super.phoneNumber,
      required super.name,
      required super.sub,
      required super.channel,
      required super.image});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    print(json.toString());
    return UserModel(
      id: json["id"],
      iat: json['iat'],
      // firstName: json["firstName"] ?? "",
      // lastName: json["lastName"] ?? "",
      email: json["email"] ?? "",
      name: json["name"] ?? "",
      phoneNumber: json["phone_number"] ?? "",
      sub: json["sub"] ?? "",
      channel: json["channel"] ?? "",
      image: json["image"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        // "firstName": firstName,
        // "lastName": lastName,
        "email": email,
        "name": name,
      };
}
