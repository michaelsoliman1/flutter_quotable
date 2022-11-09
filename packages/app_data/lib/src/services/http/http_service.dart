import 'package:app_data/src/services/http/models/response/server_response.dart';

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
  });

  /// returns [ServerListResponse] that's parsed from the response body
  ///
  /// the [page][limit] parameters is used for pagination
  /// shortcut for `{'page': page, 'limit': limit}` that is added to the query params
  ///
  ///
  Future<ServerListResponse> requestList(
    String url, {
    int page = 1,
    int limit = 20,
    Map<String, dynamic>? queryParameters,
  });

  /// handy method for doing GET requests
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
  }) {
    return request(
      method: Method.get,
      url: url,
      queryParameters: queryParameters,
    );
  }

  /// handy method for doing POST requests
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
  }) {
    return request(
      method: Method.post,
      url: url,
      body: body,
    );
  }

  /// handy method for doing PUT requests
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
  }) {
    return request(
      method: Method.put,
      url: url,
      body: body,
    );
  }

  /// handy method for doing DELETE requests
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
    String url,
  ) {
    return request(
      method: Method.delete,
      url: url,
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
