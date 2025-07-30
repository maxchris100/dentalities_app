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
      "/api/cart",
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
      "/api/cart/update",
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
    return await DioClient.instance.post(
      "/api/v2/checkout/select-delivery-method",
      data: [
        {
          "user_address_id": userAddressId,
        }
      ],
    );
  }

  static Future<Response> checkOutOrder({
    int? userAddressId,
    String? serviceCode,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.post(
      "/api/v2/checkout",
      data: [
        {
          "user_address_id": userAddressId,
          "service_code": serviceCode,
        }
      ],
    );
  }
}
