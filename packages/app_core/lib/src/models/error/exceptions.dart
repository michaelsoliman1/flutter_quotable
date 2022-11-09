// ignore_for_file: public_member_api_docs

/// {@template unknownException}
///
/// An exception due to uncaught third-party exceptions
///
/// {@endtemplate}
class UnknownException implements Exception {
  /// {@macro unknownException}
  const UnknownException({
    this.message = '',
    this.stackTrace,
  });

  final String message;
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'UnknownException(message: )';
  }
}
