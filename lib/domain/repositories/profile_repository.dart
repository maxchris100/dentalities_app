import 'package:dio/dio.dart';
import 'package:foriyana_app/core/util/date_format.dart';
import 'package:foriyana_app/core/util/dio_client.dart';

class ProfileRepository {
  ProfileRepository._();

  static Future<Response> getProfile(
    String channel, {
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/v1/profile",
      queryParameters: {"channel": channel},
    );
  }

  static Future<Response> getDownline(
    String channel, {
    int page = 1,
    int limit = 50,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/v1/downline",
      queryParameters: {"channel": channel},
    );
  }

  static Future<Response> getStatistic(
    String channel, {
    String? startDate,
    String? endDate,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/v1/statistics",
      queryParameters: {
        "channel": channel,
        "startDate": startDate,
        "endDate": endDate,
      },
    );
  }

  static Future<Response> getDownlineStatistic(
    String channel, {
    String? startDate,
    String? endDate,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/v1/downline/statistics",
      queryParameters: {
        "channel": channel,
        "startDate": startDate,
        "endDate": endDate,
      },
    );
  }

  static Future<Response> getProductHotLeads(
    String channel,
    String product, {
    String filter = 'Personal Info',
    int page = 1,
    int limit = 100,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/v1/products/hot-leads",
      queryParameters: {
        "channel": channel,
        "product": product,
        "filter": filter,
        "page": page,
        "limit": limit,
      },
    );
  }

  static Future<Response> getProductList(
    String channel, {
    String sort = 'best',
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/v1/products/list",
      queryParameters: {"channel": channel, "sort": sort},
    );
  }

  static Future<Response> getProductPlan(
    String channel,
    String productId, {
    String sort = 'best',
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/v1/products/plans",
      queryParameters: {
        "channel": channel,
        "sort": sort,
        "product_id": productId,
      },
    );
  }

  static Future<Response> getProductCompleted(
    String channel, {
    String sort = 'best',
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/v1/products/complete",
      queryParameters: {"channel": channel, "sort": sort},
    );
  }

  static Future<Response> getCommission(
    String channel, {
    int page = 1,
    int limit = 50,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/v1/commissions",
      queryParameters: {"channel": channel},
    );
  }

  static Future<Response> getCommissionTransactions(
    String channel,
    String startDate,
    String endDate, {
    int page = 1,
    int limit = 50,
    CancelToken? cancelToken,
  }) async {
    return await DioClient.instance.get(
      "/v1/commissions/transactions",
      queryParameters: {
        "channel": channel,
        "from": startDate,
        "to": endDate,
        "page": page,
        "limit": limit,
      },
    );
  }
}
