import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? sub;
  final String? role;
  final String? channel;
  final String? lastLogin;
  final String? image;
  final String? email;
  final String? token;
  final int totalContribution;
  final int expectedCommission;
  final String? name;
  const User({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.sub,
    this.role,
    this.channel,
    this.lastLogin,
    this.image,
    this.email,
    this.token,
    this.totalContribution = 0,
    this.expectedCommission = 0,
  });

  @override
  List<Object> get props => [];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      name: json['name'],
      image: json['image'],
      email: json['email'],
      token: json['token'],
    );
  }
}
