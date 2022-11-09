// we don't need an interceptor for our api, but it's kept as an example
// ignore_for_file: todo

import 'package:app_core/app_core.dart';
import 'package:dio/dio.dart';

/// {@template authInterceptor}
///
/// Dio Interceptor for authenticating requests
///
/// {@endtemplate}
class AuthInterceptor extends QueuedInterceptor {
  /// {@macro authInterceptor}
  AuthInterceptor();

  // TODO add your auth token
  Map<String, String> get _authHeaders => {'Authorization': 'Bearer {your_auth_token}'};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = options.headers..addAll(_authHeaders);
    super.onRequest(options, handler);
  }

  @override
  // ignore: avoid_void_async, avoid_renaming_method_parameters
  void onError(DioError error, ErrorInterceptorHandler handler) async {
    try {
      _logError(error);
      if (error.response?.statusCode == 401) {
        // TODO add your auth refresh logic

      }
      return handler.reject(error);
    } on DioError catch (e) {
      handler.reject(e);
    } catch (e, s) {
      Logger.severe(e, stackTrace: s);
      handler.reject(error);
    }
  }

  String _shortenPath(String path) {
    final matchIndex = path.indexOf('api');
    return matchIndex == -1 ? path : path.substring(matchIndex);
  }

  void _logError(DioError error) {
    Logger.error(
      '''
        API ERROR: ${error.error ?? ''}
        Status Code: ${error.response?.statusCode ?? ''} 
        Status Message: ${error.response?.statusMessage ?? ''} 
        Path: ${_shortenPath(error.requestOptions.path)}''',
    );
  }
}
