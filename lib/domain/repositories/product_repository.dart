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
    int? page = 1,
    int? limit = 20,
    String? sort = 'latest',
    String? keyword,
    String? countries,
    String? brands,
    String? categories,
    String? specialization_slug,
    int? newArrival,
    int? readyStock,
    int? onPromo,
    CancelToken? cancelToken,
  }) async {
    final queryParams = <String, dynamic>{};
    if (page != null) queryParams['page'] = page;
    if (limit != null) queryParams['limit'] = limit;
    if (brands != null && brands != "") {
      // queryParams['brands'] = brands;
      queryParams['brand'] = brands;
    }
    if (categories != null && categories != "") {
      // queryParams['categories'] = categories;
      // queryParams['category'] = categories;
      queryParams['specialization'] = categories;
    }
    if (specialization_slug != null && specialization_slug != "") {
      queryParams['specialization_slug'] = specialization_slug;
      queryParams['aggregate'] = 'category';
    }
    if (keyword != null) {
      queryParams['keyword'] = keyword;
      queryParams['search'] = keyword;
    }
    if (sort != null) {
      queryParams['sort'] = sort;
    }
    if (newArrival == 1) {
      queryParams['is_new'] = true;
    }
    if (readyStock == 1) {
      queryParams['in_stock'] = true;
    }
    if (onPromo == 1) {
      queryParams['on_sale'] = true;
    }
    return await DioClient.instance.get(
      "/api/v2/product",
      // "/api/home/search-products",
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
