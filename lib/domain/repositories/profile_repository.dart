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

  static Future<Response> addAddress({
    required String provinceId,
    required String cityId,
    required String districtId,
    required String subdistrictId,
    required String postalCode,
    required String address,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.post(
      "/api/v2/account/add-address",
      data: {
        "province_id": provinceId,
        "city_id": cityId,
        "district_id": districtId,
        "subdistrict_id": subdistrictId,
        "postal_code": postalCode,
        "address": address
      },
      cancelToken: cancelToken,
    );
  }

  static Future<Response> updateAddress({
    required int userAddressId,
    required String provinceId,
    required String cityId,
    required String districtId,
    required String subdistrictId,
    required String postalCode,
    required String address,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.post(
      "/api/v2/account/add-address",
      data: {
        "user_address_id": userAddressId,
        "province_id": provinceId,
        "city_id": cityId,
        "district_id": districtId,
        "subdistrict_id": subdistrictId,
        "postal_code": postalCode,
        "address": address
      },
      cancelToken: cancelToken,
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
