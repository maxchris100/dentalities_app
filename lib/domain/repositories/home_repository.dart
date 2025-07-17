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

  /// GET /v2/home/banners
  static Future<Response> getBanners({
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/home/banners",
      cancelToken: cancelToken,
    );
  }
}
