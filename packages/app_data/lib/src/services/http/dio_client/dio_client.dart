import 'dart:convert';
import 'dart:io';

import 'package:app_core/app_core.dart' hide Response;
import 'package:app_data/src/locator/constants.dart';
import 'package:app_data/src/services/http/dio_client/interceptors/log_interceptor.dart';
import 'package:app_data/src/services/http/http_service.dart';
import 'package:app_data/src/services/http/models/error/error.dart';
import 'package:app_data/src/services/http/models/response/server_error.dart';
import 'package:app_data/src/services/http/models/response/server_response.dart';
import 'package:dio/dio.dart' hide LogInterceptor;
import 'package:injectable/injectable.dart';

@Singleton(as: HttpService)
class DioClient extends HttpService {
  DioClient(
    @Named(baseUrlInstanceName) String url,
  ) {
    _client = Dio(
      BaseOptions(baseUrl: url, connectTimeout: 1000 * 15), //
    )..interceptors.addAll([LogInterceptor()]);
  }

  late final Dio _client;

  @override
  Future<ServerResponse> request({
    required String url,
    required Method method,
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) {
    return _request(
      method: method,
      url: url,
      queryParameters: queryParameters,
      body: body,
    );
  }

  @override
  Future<ServerPageResponse> requestPage(
    String url, {
    int page = 1,
    int limit = 20,
    Map<String, dynamic>? queryParameters,
  }) {
    final params = <String, dynamic>{}..addAll(queryParameters ?? {});
    if (!params.containsKey('page')) {
      params.addAll({'page': page});
    }
    if (!params.containsKey('limit')) {
      params.addAll({'limit': limit});
    }
    return _requestList(
      url: url,
      queryParameters: params,
    );
  }

  Future<ServerResponse> _request({
    required Method method,
    required String url,
    dynamic body,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _doRequest<Map<String, dynamic>>(
        method: method,
        url: url,
        body: body,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      return ServerResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      _handleDioError(dioError);
      throw const UnknownException();
    } catch (e, s) {
      Logger.severe(e, stackTrace: s);
      throw const UnknownException();
    }
  }

  Future<ServerPageResponse> _requestList({
    required String url,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _doRequest<Map<String, dynamic>>(
        method: Method.get,
        url: url,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      return ServerPageResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      _handleDioError(dioError);
      throw const UnknownException();
    } catch (e, s) {
      Logger.severe(e, stackTrace: s);
      throw const UnknownException();
    }
  }

  Future<Response<T>> _doRequest<T>({
    required Method method,
    required String url,
    dynamic body,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    switch (method) {
      case Method.get:
        return _client.get(
          url,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
        );
      case Method.delete:
        return _client.delete(
          url,
          data: body,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
        );
      case Method.post:
        return _client.post(
          url,
          data: body,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
        );
      case Method.put:
        return _client.put(
          url,
          data: body,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
        );
    }
  }

  void _handleDioError(DioError dioError) {
    if (dioError.error is SocketException) {
      throw const NetworkException();
    }

    if (dioError.type == DioErrorType.connectTimeout) {
      throw const NetworkException('Connection Timed out');
    }

    if (dioError.response == null) throw const UnknownException();

    if (dioError.response!.statusCode! >= 500) {
      throw InternalServerException(details: dioError.message);
    }

    // check the error type first
    // if it's json , create a [ServerError] instance from that json map
    // else, it's String,
    // then create a [ServerError] instance with that message
    if (dioError.response?.data == null) {
      throw const UnknownException();
    }

    if (dioError.response!.data is Map) {
      final serverError = ServerError.fromJson(
        dioError.response!.data! as Map<String, dynamic>,
      );
      Logger.error(serverError.toString());
      throw BadRequestException(serverError);
    }
    if (dioError.response!.data is String) {
      final jsonMap = _tryParseJson(dioError.response!.data! as String);
      if (jsonMap != null) {
        throw BadRequestException(ServerError.fromJson(jsonMap));
      }
      throw const BadRequestException(ServerError());
    }
  }

  Map<String, dynamic>? _tryParseJson(String source) {
    try {
      return json.decode(source) as Map<String, dynamic>;
    } on FormatException {
      return null;
    }
  }
}
