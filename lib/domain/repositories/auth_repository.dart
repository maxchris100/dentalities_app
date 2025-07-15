import 'package:dio/dio.dart';
import 'package:foriyana_app/core/util/dio_client.dart';

class AuthRepository {
  AuthRepository._();
  static Future<Response> signIn({
    required String emailOrPhone,
    required String password,
    required String loginType,
    String? accessToken,
    CancelToken? cancelToken,
  }) async {
    String fcmToken = '';
    String deviceModel = '';
    String deviceType = '';
    String deviceId = '';
    return await DioClient.instance.post(
      "/v1/auth/login",
      data: {
        "emailOrPhone": emailOrPhone,
        "password": password,
        "fcmToken": fcmToken,
        "deviceModel": deviceModel,
        "deviceType": deviceType,
        "deviceId": deviceId,
        "loginType": loginType,
        if (accessToken != null) "accessToken": accessToken,
      },
      cancelToken: cancelToken,
    );
  }

  static Future<Response> signUp({
    required String email,
    required String phone,
    required String password,
    required String name,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.post(
      "/v1/auth/register",
      data: {
        "email": email,
        "phone": phone,
        "password": password,
        "name": name,
      },
      cancelToken: cancelToken,
    );
  }

  static Future<Response> getSession({
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/v1/auth/session",
      queryParameters: {},
    );
  }

  static Future<Response> signOut({
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.post(
      "/v1/auth/logout",
      queryParameters: {},
    );
  }
}
