import 'package:dio/dio.dart';
import 'package:dentalities/core/util/dio_client.dart';

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
      "/api/v2/auth/login",
      data: {
        "email": emailOrPhone,
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

  static Future<Response> register({
    required String salutation,
    required String titlePrefix,
    required String fullName,
    required String titleSuffix,
    required String phoneCode,
    required String phoneNumber,
    required String email,
    required String password,
    required String provinceId,
    required String cityId,
    required String districtId,
    required String subdistrictId,
    required String postalCode,
    required String address,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.post(
      "/api/v2/auth/register",
      data: {
        "salutation": salutation,
        "title_prefix": titlePrefix,
        "full_name": fullName,
        "title_suffix": titleSuffix,
        "phone_code": phoneCode,
        "phone_number": phoneNumber,
        "email": email,
        "password": password,
        "province_id": provinceId,
        "city_id": cityId,
        "district_id": districtId,
        "subdistrict_id": subdistrictId,
        "postal_code": postalCode,
        "address": address,
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

  static Future<Response> forgotPassword({
    required String email,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.post(
      "/api/v2/auth/forgot-password",
      data: {
        "email": email,
      },
      cancelToken: cancelToken,
    );
  }

  static Future<Response> signOut({
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.post(
      "/api/v2/auth/logout",
      queryParameters: {},
    );
  }

  static Future<Response> changePassword({
    String? currentPassword,
    String? newPassword,
    String? newPasswordConfirm,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance
        .post("/api/v2/account/change-password", data: {
      "current_password": currentPassword,
      "new_password": newPassword,
      "new_password_confirm": newPasswordConfirm
    });
  }
}
