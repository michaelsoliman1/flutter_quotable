import 'package:app_core/src/services/http/models/response/server_response.dart';
import 'package:dio/dio.dart';

/// Interface for http service
abstract class HttpService {
  /// {@template HttpService.request}
  ///
  /// returns [ServerResponse] that's parsed from the response body
  ///
  /// {@endtemplate}
  Future<ServerResponse> request({
    required String url,
    required Method method,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    CancelToken? cancelToken,
  });

  /// returns [ServerListResponse] that's parsed from the response body
  ///
  /// the [afterId] parameter can be used for pagination
  /// shortcut for header `{'afterId': afterId}` that is added to the query params
  ///
  ///
  Future<ServerListResponse> requestList(
    String url, {
    String? afterId,
    Map<String, dynamic>? queryParameters,
  });

  /// handy method for doing GET request
  ///
  /// equivelant to
  /// ```
  /// request({
  ///  '/some/url/'
  ///  Method.get,
  /// });
  /// ```
  /// {@macro HttpService.request}
  Future<ServerResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) {
    return request(
      method: Method.get,
      url: url,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
    );
  }

  /// handy method for doing POST request
  ///
  /// equivelant to
  /// ```
  /// request({
  ///  '/some/url/'
  ///  Method.post,
  /// });
  /// ```
  /// {@macro HttpService.request}
  Future<ServerResponse> post(
    String url, {
    dynamic body,
    CancelToken? cancelToken,
  }) {
    return request(
      method: Method.post,
      url: url,
      body: body,
      cancelToken: cancelToken,
    );
  }

  /// handy method for doing PUT request
  ///
  /// equivelant to
  /// ```
  /// request({
  ///  '/some/url/'
  ///  Method.put,
  /// });
  /// ```
  /// {@macro HttpService.request}
  Future<ServerResponse> put(
    String url, {
    dynamic body,
    CancelToken? cancelToken,
  }) {
    return request(
      method: Method.put,
      url: url,
      body: body,
      cancelToken: cancelToken,
    );
  }

  /// handy method for doing DELETE request
  ///
  /// equivelant to
  /// ```
  /// request({
  ///  '/some/url/'
  ///  Method.delete,
  /// });
  /// ```
  /// {@macro HttpService.request}
  Future<ServerResponse> delete(
    String url, {
    CancelToken? cancelToken,
  }) {
    return request(
      method: Method.delete,
      url: url,
      cancelToken: cancelToken,
    );
  }
}

/// The Http method to use for the request
enum Method {
  /// GET
  get,

  /// POST
  post,

  /// PUT
  put,

  /// DELETE
  delete,
}
