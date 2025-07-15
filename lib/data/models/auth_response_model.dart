import 'dart:convert';

import '../../domain/entities/auth/auth.dart';

AuthResponseModel authResponseModelFromJson(String str) =>
    AuthResponseModel.fromJson(json.decode(str));

String authResponseModelToJson(AuthResponseModel data) =>
    json.encode(data.toJson());

class AuthResponseModel extends Auth {
  const AuthResponseModel({
    required super.message,
    required super.token,
  });

  /// Factory constructor to create an instance from JSON
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        message: json["message"] ?? "", // Default to empty string if null
        token: json["access_token"] ?? "", // Default to empty string if null
      );

  /// Convert instance to JSON format
  Map<String, dynamic> toJson() => {
        "message": message,
        "access_token": token,
      };
}
