import 'package:dio/dio.dart';
import 'package:dentalities/core/util/date_format.dart';
import 'package:dentalities/core/util/dio_client.dart';

class ProfileRepository {
  ProfileRepository._();

  static Future<Response> getProfile({
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/account/profile",
      cancelToken: cancelToken,
    );
  }

  /// POST /v2/account/profile
  static Future<Response> updateProfile({
    required String fullName,
    required String phoneCode,
    required String phoneNumber,
    required String email,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.post(
      "/api/v2/account/profile",
      data: {
        "full_name": fullName,
        "phone_code": phoneCode,
        "phone_number": phoneNumber,
        "email": email,
      },
      cancelToken: cancelToken,
    );
  }

  /// POST /v2/account/change-password
  static Future<Response> changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirm,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.post(
      "/api/v2/account/change-password",
      data: {
        "current_password": currentPassword,
        "new_password": newPassword,
        "new_password_confirm": newPasswordConfirm,
      },
      cancelToken: cancelToken,
    );
  }

  static Future<Response> getUserAddress({
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/account/user-addresses",
      cancelToken: cancelToken,
    );
  }

  static Future<Response> getDefaultAddress({
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/account/default-address",
      cancelToken: cancelToken,
    );
  }

  static Future<dynamic> updateDefaultAddress({
    required int userAddressId,
  }) async {
    return await DioClient.instance.post(
      "/api/v2/account/default-address",
      data: {
        "user_address_id": userAddressId,
      },
    );
  }

  static Future<dynamic> addAddress({
    required String label,
    required String phone,
    required String fullName,
    required String provinceId,
    required String cityId,
    required String districtId,
    required String subdistrictId,
    required String postalCode,
    required String address,
  }) async {
    return await DioClient.instance.post(
      "/api/v2/account/add-address",
      data: {
        "label": label,
        "phone_code": "62",
        "phone_number": phone,
        "full_name": fullName,
        "province_id": provinceId,
        "city_id": cityId,
        "district_id": districtId,
        "subdistrict_id": subdistrictId,
        "postal_code": postalCode,
        "address": address,
      },
    );
  }

  static Future<dynamic> updateAddress({
    required int userAddressId,
    required String label,
    required String phone,
    required String fullName,
    required String provinceId,
    required String cityId,
    required String districtId,
    required String subdistrictId,
    required String postalCode,
    required String address,
  }) async {
    return await DioClient.instance.post(
      "/api/v2/account/update-address",
      data: {
        "user_address_id": userAddressId,
        "label": label,
        "phone_code": "62",
        "phone_number": phone,
        "full_name": fullName,
        "province_id": provinceId,
        "city_id": cityId,
        "district_id": districtId,
        "subdistrict_id": subdistrictId,
        "postal_code": postalCode,
        "address": address,
      },
    );
  }

  static Future<Response> deleteAddress({
    required int userAddressId,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.post(
      "/api/v2/account/delete-address",
      data: {
        "user_address_id": userAddressId,
      },
      cancelToken: cancelToken,
    );
  }
}
