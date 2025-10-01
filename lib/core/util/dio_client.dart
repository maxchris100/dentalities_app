import 'dart:developer';
import 'dart:io';

import 'package:dentalities/core/router/app_router.dart';
import 'package:dentalities/presentation/blocs/cubit/auth_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dentalities/core/constant/constant.dart';
import 'package:dentalities/core/util/string_util.dart';
import 'package:dentalities/data/data_sources/user_local_data_source.dart';

class DioClient {
  static final instance = DioClient();
  late Dio dio;

  DioClient() {
    dio = _initiateDio();
  }

  Dio _initiateDio() {
    var _dio = Dio();
    _dio.options.baseUrl = StringUtil.castToString(dotenv.env["BASE_API_URL"]);
    _dio.options.connectTimeout = Duration(milliseconds: 30000);
    _dio.options.receiveTimeout = Duration(milliseconds: 30000);
    _dio.options.validateStatus = (status) {
      return status! <= 500; // Termasuk 400 tetap dianggap valid
    };
    _dio.options.headers = {
      HttpHeaders.contentTypeHeader: "application/json",
    };
    _dio.interceptors.add(_defaultInterceptor());
    if (Constant.getQAEnvironment()) {
      // _dio.interceptors.add(Constant.alice!.getDioInterceptor());
    }
    return _dio;
  }

  InterceptorsWrapper _defaultInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = Constant.userLocalDataSource.token;
        options.headers["Authorization"] = "Bearer $token";
        log("REQUEST => ${options.method}: ${options.uri} ${token}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        log("RESPONSE => ${response.statusCode}: ${response.requestOptions.uri}");
        if (response.statusCode == 401) {
          _goToLogin();
          return;
        }
        return handler.next(response);
      },
      onError: (error, handler) {
        log("ERROR => ${error.message}");
        if (error.response?.statusCode == 401) {
          _goToLogin();
          return;
        }
        return handler.next(error);
      },
    );
  }

  void _goToLogin() {
    log("Redirecting to LoginPage due to 401...");
    Constant.userLocalDataSource.clearCache();
    final navigator = Constant.getNavigatorKey().currentState;
    if (navigator == null) {
      log('Navigator is NULL!');
      return;
    }

    AuthCubit authCubit =
        Constant.navigatorKey.currentContext!.read<AuthCubit>();
    authCubit.logout();
    // navigator.pushNamedAndRemoveUntil(
    //   AppRouter.signIn,
    //   (route) => false,
    // );
  }

  void reInitiateDio() {
    dio = _initiateDio();
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<Response> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<Response> put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<Response> delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } catch (e) {
      return _handleError(e);
    }
  }

  Response _handleError(dynamic e) {
    String message = 'Koneksi terputus';
    if (e is DioError) {
      message = e.message ?? message;
      return Response(
        requestOptions:
            RequestOptions(path: e.response?.requestOptions.path ?? ""),
        statusCode: e.response?.statusCode,
        statusMessage: message,
        data: e.response?.data,
      );
    }
    return Response(
      requestOptions: RequestOptions(path: ''),
      statusCode: e[""],
      statusMessage: message,
      data: {"status": 999, "message": message},
    );
  }
}
