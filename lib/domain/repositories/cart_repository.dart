import 'package:dio/dio.dart';
import 'package:dentalities/core/util/date_format.dart';
import 'package:dentalities/core/util/dio_client.dart';

class CartRepository {
  CartRepository._();

  static Future<Response> getCart({
    int page = 1,
    int limit = 50,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/cart",
      queryParameters: {
        "page": page,
        "limit": limit,
      },
    );
  }

  static Future<Response> addUpdateCart({
    int? productVariantId,
    int? quantity,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.post(
      "/api/v2/cart/update",
      data: [
        {
          "product_variant_id": productVariantId,
          "quantity": quantity,
        }
      ],
    );
  }

  static Future<Response> getDeliveryMethod({
    int? userAddressId,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance
        .post("/api/checkout/select-delivery-method", data: {
      "user_address_id": userAddressId,
    });
  }

  static Future<Response> checkOutOrder({
    int? userAddressId,
    String? serviceCode,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.post("/api/v2/checkout", data: {
      "user_address_id": userAddressId,
      "service_code": serviceCode,
    });
  }

  static Future<Response> getOrderList({
    int? page = 1,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance
        .get("/api/v2/transaction", queryParameters: {"page": page});
  }

  static Future<Response> getOrderDetail({
    String? uid,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/transaction/$uid",
    );
  }

  static Future<Response> getOrderTracking({
    String? uid,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/api/v2/transaction/$uid/track",
    );
  }

  static Future<Response> getWishlist({
    int? page = 1,
    int? limit = 20,
    CancelToken? cancelToken,
  }) async {
    final queryParams = <String, dynamic>{};
    if (page != null) queryParams['page'] = page;
    if (limit != null) queryParams['limit'] = limit;
    return await DioClient.instance.get(
      "/api/v2/wishlist",
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
  }

  static Future<Response> getWishlistByProducts({
    int? page = 1,
    int? limit = 20,
    CancelToken? cancelToken,
  }) async {
    final queryParams = <String, dynamic>{};
    if (page != null) queryParams['page'] = page;
    if (limit != null) queryParams['limit'] = limit;
    return await DioClient.instance.get(
      "/api/v2/wishlist/by-products",
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
  }

  /// Add to wishlist (with variant)
  static Future<Response> addToWishlistWithVariant({
    required int productId,
    required int productVariantId,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.post(
      "/api/v2/wishlist",
      data: {
        "product_id": productId,
        "product_variant_id": productVariantId,
      },
      cancelToken: cancelToken,
    );
  }

  /// Add to wishlist (product only)
  static Future<Response> addToWishlist({
    required int productId,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.post(
      "/api/v2/wishlist",
      data: {
        "product_id": productId,
      },
      cancelToken: cancelToken,
    );
  }

  /// Remove item from wishlist
  static Future<Response> removeFromWishlist({
    required int id,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.delete(
      "/api/v2/wishlist/$id",
      cancelToken: cancelToken,
    );
  }

  static Future<Response> removeFromWishlistByProduct({
    required int id,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.delete(
      "/api/v2/wishlist/by-product/$id",
      cancelToken: cancelToken,
    );
  }

  static Future<Response> removeFromWishlistByProductVariant({
    required int id,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.delete(
      "/api/v2/wishlist/by-product-variant/$id",
      cancelToken: cancelToken,
    );
  }

  /// Check wishlist status
  static Future<Response> checkWishlistStatus({
    required int productId,
    int? productVariantId,
    CancelToken? cancelToken,
  }) async {
    final queryParams = {
      "product_id": productId,
      if (productVariantId != null) "product_variant_id": productVariantId,
    };

    return await DioClient.instance.get(
      "/api/v2/wishlist/check",
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
  }
}
