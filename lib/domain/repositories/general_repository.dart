import 'package:dio/dio.dart';
import 'package:dentalities/core/util/dio_client.dart';

class GeneralRepository {
  /// GET /v2/region/provinces
  static Future<Response> getProvinces({
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/region/provinces",
      cancelToken: cancelToken,
    );
  }

  /// GET /v2/region/cities?province_id=...
  static Future<Response> getCities(
    String provinceId, {
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/region/cities",
      queryParameters: {"province_id": provinceId},
      cancelToken: cancelToken,
    );
  }

  /// GET /v2/region/districts?city_id=...
  static Future<Response> getDistricts(
    String cityId, {
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/region/districts",
      queryParameters: {"city_id": cityId},
      cancelToken: cancelToken,
    );
  }

  /// GET /v2/region/subdistricts?district_id=...
  static Future<Response> getSubdistricts(
    String districtId, {
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/region/subdistricts",
      queryParameters: {"district_id": districtId},
      cancelToken: cancelToken,
    );
  }
}
