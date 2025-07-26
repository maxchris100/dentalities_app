import 'dart:convert';

import 'package:dentalities/data/models/user_address_model.dart';
import 'package:equatable/equatable.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends Equatable {
  final int? id;
  final int? iat;
  final String? firstName;
  final String? lastName;
  final String? sub;
  final String? role;
  final String? channel;
  final String? lastLogin;
  final String? image;
  final String? email;
  final String? token;

  final String? salutation;
  final String? titlePrefix;
  final String? titleSuffix;
  final String? fullName;
  final String? phoneCode;
  final String? phone;
  final String? password;
  final bool? isApproved;
  final String? loginToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<UserAddress>? userAddresses;

  UserModel(
      {this.id,
      this.iat,
      this.firstName,
      this.lastName,
      this.sub,
      this.role,
      this.channel,
      this.lastLogin,
      this.image,
      this.email,
      this.token,
      this.salutation,
      this.titlePrefix,
      this.titleSuffix,
      this.fullName,
      this.phoneCode,
      this.phone,
      this.password,
      this.isApproved,
      this.loginToken,
      this.createdAt,
      this.updatedAt,
      this.userAddresses = const []});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'iat': iat,
      'firstName': firstName,
      'lastName': lastName,
      'sub': sub,
      'role': role,
      'channel': channel,
      'lastLogin': lastLogin,
      'image': image,
      'email': email,
      'token': token,
      'salutation': salutation,
      'titlePrefix': titlePrefix,
      'titleSuffix': titleSuffix,
      'fullName': fullName,
      'phoneCode': phoneCode,
      'phone': phone,
      'password': password,
      'isApproved': isApproved,
      'loginToken': loginToken,
      'userAddresses': userAddresses?.map((x) => x.toJson()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      iat: map['iat'] != null ? map['iat'] as int : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      sub: map['sub'] != null ? map['sub'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      channel: map['channel'] != null ? map['channel'] as String : null,
      lastLogin: map['lastLogin'] != null ? map['lastLogin'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      salutation:
          map['salutation'] != null ? map['salutation'] as String : null,
      titlePrefix:
          map['titlePrefix'] != null ? map['titlePrefix'] as String : null,
      titleSuffix:
          map['titleSuffix'] != null ? map['titleSuffix'] as String : null,
      fullName: map['fullName'],
      phoneCode: map['phoneCode'],
      phone: map['phone'],
      isApproved: map['isApproved'],
      loginToken: map['loginToken'],
      userAddresses: map['userAddresses'] != null
          ? List<UserAddress>.from(
              (map['userAddresses'] as List<int>).map<UserAddress>(
                (x) => UserAddress.fromJson(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [];
}
