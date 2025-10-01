import 'package:dio/dio.dart';
import 'package:dentalities/core/util/dio_client.dart';

class HomeRepository {
  /// GET /v2/home/feature-categories
  static Future<Response> getFeatureCategories({
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/home/feature-categories",
      cancelToken: cancelToken,
    );
  }

  static Future<Response> getListMenu({
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/home/list-menu",
      cancelToken: cancelToken,
    );
  }

  /// GET /v2/home/banners
  static Future<Response> getBanners({
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      // "/api/v2/home/banners",
      "/api/home/banners",
      cancelToken: cancelToken,
    );
  }

  static Future<Response> getBrands({
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/brand",
      cancelToken: cancelToken,
    );
  }

  static Future<Response> getTutorial({
    int limit = 10,
    int page = 0,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/tutorial?limit=$limit",
      cancelToken: cancelToken,
    );
  }

  static Future<Response> getTestimonial({
    int limit = 10,
    int page = 0,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/testimonial?limit=$limit",
      cancelToken: cancelToken,
    );
  }
}
