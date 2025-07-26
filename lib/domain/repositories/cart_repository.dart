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
}
