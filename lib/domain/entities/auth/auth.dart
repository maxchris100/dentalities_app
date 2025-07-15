import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  final String message;
  final String token;
  final Map<String, dynamic>? decodedToken;

  const Auth({
    required this.message,
    required this.token,
    this.decodedToken,
  });

  @override
  List<Object> get props => [
        message,
        token,
      ];
}
