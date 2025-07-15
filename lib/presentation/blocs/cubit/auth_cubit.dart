import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foriyana_app/core/constant/constant.dart';
import 'package:foriyana_app/domain/repositories/auth_repository.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:foriyana_app/data/data_sources/user_local_data_source.dart';
import 'package:foriyana_app/data/models/auth_response_model.dart';
import 'package:foriyana_app/data/models/user_model.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthInitialStartup extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated<T> extends AuthState {
  final UserModel user;

  AuthAuthenticated(this.user);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class AuthCubit extends Cubit<AuthState> {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final String tokenKey = 'TOKEN';
  AuthCubit() : super(AuthLoading());

  // User getUserInformation(String token) {
  //   Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
  //   print(decodedToken.toString());
  //   User user = User.fromJson(decodedToken);
  //   return user;
  //   // userLocalDataSource.getUser();
  //   // setUser(decodedToken);
  //   // if (decodedToken["role"]?.toLowerCase() == "insurer")
  //   //   setIsPartnerRole(false);
  //   // else
  //   //   setIsPartnerRole(true);
  // }

  Future<void> checkAuthStatus() async {
    try {
      String? token = await secureStorage.read(key: tokenKey);
      if (token != null && token.isNotEmpty) {
        //check token
        handleSessionCode().then((value) {
          //FORBIDDEN SESSION EXPIRED
          // log(value);
          // if (value == "") {
          //session not found
          //logout
          //   logout();
          // }
        });

        //decode token
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        UserModel user = UserModel.fromJson(decodedToken);
        UserLocalDataSource.userData = user;
        UserLocalDataSource.token = token;

        emit(AuthAuthenticated(user));
      } else {
        String? isFirstTime = await secureStorage.read(key: "isFirstTime");
        if (isFirstTime == null) {
          emit(AuthInitialStartup());
        } else {
          emit(AuthInitial());
        }
      }
    } catch (e) {
      emit(AuthInitial());
    }
  }

  Future<void> saveToken(String token) async {
    await secureStorage.write(key: tokenKey, value: token);
    //decode token
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    UserModel user = UserModel.fromJson(decodedToken);
    UserLocalDataSource.userData = user;
    emit(AuthAuthenticated(user));
  }

  Future<void> logout() async {
    await secureStorage.delete(key: tokenKey);
    UserLocalDataSource.userData = null;
    UserLocalDataSource.token = null;
    // UserLocalDataSource.language = 'en';
    emit(AuthInitial());
  }

  Future<void> login(BuildContext context, String email, String password,
      {String loginType = 'manual'}) async {
    try {
      String accessToken = '';
      var response = await AuthRepository.signIn(
          emailOrPhone: email,
          password: password,
          loginType: loginType,
          accessToken: accessToken);

      var responseLogin = authResponseModelFromJson(response.data["data"]);
      debugPrint('responseLogin.token: ${responseLogin.token}');

      await Constant.userLocalDataSource.saveToken(responseLogin.token);

      Map<String, dynamic> decodedToken =
          JwtDecoder.decode(responseLogin.token);
      print("decodedToken: $decodedToken");

      // UserModel user = await Constant.userLocalDataSource.getUser();
      // await userLocalDataSource.saveUser(user);
      // context.read<AuthCubit>().getUserInformation(responseLogin.token);

      // UserModel u = await userLocalDataSource.getUser();
      // context.read<AuthCubit>().checkAuthStatus();

      Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      debugPrint('Refresh Token error: $e');
    }
  }

  Future<void> handleSessionCode() async {
    try {
      // var response = await http.post(
      //   Uri.parse(
      //     "${Constant.baseApiUrl}/v1/auth/session",
      //   ),
      //   headers: <String, String>{
      //     'authorization': 'Bearer ${UserLocalDataSource.token}',
      //   },
      //   body: {},
      // );

      // debugPrint('Response Code: ${response.body}');

      // var responseLogin = authResponseModelFromJson(response.body);
      // debugPrint('responseLogin.token: ${responseLogin.token}');

      // await Constant.userLocalDataSource.saveToken(responseLogin.token);

      // Map<String, dynamic> decodedToken =
      //     JwtDecoder.decode(responseLogin.token);
      // print("decodedToken: $decodedToken");

      // UserModel user = await Constant.userLocalDataSource.getUser();
      // await userLocalDataSource.saveUser(user);
      // context.read<AuthCubit>().getUserInformation(responseLogin.token);

      // UserModel u = await userLocalDataSource.getUser();
      // context.read<AuthCubit>().checkAuthStatus();

      // Navigate to home and remove login from backstack
      // ignore: use_build_context_synchronously
      // Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      debugPrint('Refresh Token error: $e');
    }
  }
}
