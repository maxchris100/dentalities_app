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
      "/api/v2/home/banners",
      cancelToken: cancelToken,
    );
  }

  static Future<Response> getTutorial({
    int limit = 10,
    int page = 0,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/home/tutorial?limit=$limit&page=$page&order_by=title&sort=asc",
      cancelToken: cancelToken,
    );
  }

  static Future<Response> getTestimonial({
    int limit = 10,
    int page = 0,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/home/testimonial?limit=$limit&page=$page&order_by=title&sort=asc",
      cancelToken: cancelToken,
    );
  }
}
