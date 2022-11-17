import 'package:app_core/app_core.dart';
import 'package:dio/dio.dart';

/// {@template LogInterceptor}
///
/// Dio Interceptor for logging requests
///
/// {@endtemplate}
class LogInterceptor extends QueuedInterceptor {
  /// {@macro LogInterceptor}
  LogInterceptor();

  @override
  // ignore: avoid_void_async, avoid_renaming_method_parameters
  void onError(DioError error, ErrorInterceptorHandler handler) async {
    _logError(error);
    return handler.reject(error);
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
