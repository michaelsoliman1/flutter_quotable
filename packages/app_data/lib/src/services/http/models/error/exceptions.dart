import 'package:app_data/src/services/http/models/response/server_error.dart';

abstract class ServerException implements Exception {
  String get message;
}

class BadRequestException implements ServerException {
  const BadRequestException(this.serverError);

  final ServerError serverError;

  @override
  String get message => serverError.message;

  @override
  String toString() {
    return 'BadRequestException($serverError)';
  }
}

class InternalServerException implements ServerException {
  const InternalServerException({
    this.message = 'It looks there is a problem with the server! Please try again later',
    this.details,
  });

  @override
  final String message;
  final String? details;

  @override
  String toString() => 'InternalServerException(message: $message, details: $details)';
}

class AuthException implements ServerException {
  const AuthException(this.message);

  @override
  final String message;

  @override
  String toString() => 'AuthException(message: $message)';
}

class NetworkException implements ServerException {
  const NetworkException([this.message = 'No Internet']);

  @override
  final String message;

  @override
  String toString() => 'NetworkException(message: $message)';
}
