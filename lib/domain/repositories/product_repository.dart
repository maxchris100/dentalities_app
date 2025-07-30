import 'package:dentalities/core/util/dio_client.dart';
import 'package:dio/dio.dart';

class ProductRepository {
  /// GET /v2/product/:slug
  static Future<Response> getProductBySlug(
    String slug, {
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/product/$slug",
      cancelToken: cancelToken,
    );
  }

  //category
  static Future<Response> getCategoryProducts({
    required String slug,
    int? limit,
    List<String>? brands,
    CancelToken? cancelToken,
  }) async {
    final queryParams = <String, dynamic>{};
    if (limit != null) queryParams['limit'] = limit;
    if (brands != null && brands.isNotEmpty) {
      queryParams['brands'] = brands.join(',');
    }

    return await DioClient.instance.get(
      "/api/v2/category/$slug/products",
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
  }

  static Future<Response> searchProducts({
    int? limit,
    String? keyword,
    String? brands,
    String? categories,
    CancelToken? cancelToken,
  }) async {
    final queryParams = <String, dynamic>{};
    if (limit != null) queryParams['limit'] = limit;
    if (brands != null) {
      queryParams['brands'] = brands;
    }
    if (categories != null) {
      queryParams['categories'] = categories;
    }
    if (keyword != null) {
      queryParams['keyword'] = keyword;
    }

    return await DioClient.instance.get(
      "/api/home/search-products",
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
  }

  //checkout
  static Future<Response> requestCheckout({
    required int userAddressId,
    required String serviceCode,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/checkout",
      options: Options(method: 'GET'),
      queryParameters: {
        "user_address_id": userAddressId,
        "service_code": serviceCode,
      },
      cancelToken: cancelToken,
    );
  }
}
