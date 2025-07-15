import 'package:dio/dio.dart';
import 'package:foriyana_app/core/util/date_format.dart';
import 'package:foriyana_app/core/util/dio_client.dart';

class CartRepository {
  CartRepository._();

  static Future<Response> getCart({
    int page = 1,
    int limit = 50,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/v1/cart",
      queryParameters: {
        "page": page,
        "limit": limit,
      },
    );
  }
}
