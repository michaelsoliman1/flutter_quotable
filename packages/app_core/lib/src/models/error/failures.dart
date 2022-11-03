import 'package:meta/meta.dart';

@immutable

/// {@template failure}
///
/// Base class for all failures
///
/// {@endtemplate}
abstract class Failure {
  /// {@macro failure}
  const Failure(this.message);

  /// Failure message
  final String message;

  @override
  String toString() {
    return 'Failure: $message';
  }
}

/// {@template authFailure}
///
/// Failure for authentication errors, e.g expired session
///
/// {@endtemplate}
class AuthFailure extends Failure {
  /// {@macro authFailure}
  const AuthFailure(super.message);
}

/// {@template platformFailure}
///
/// Failure for platform operation errors, e.g access external storage
///
/// {@endtemplate}
class PlatformFailure extends Failure {
  /// {@macro platformFailure}
  const PlatformFailure([super.message = '']);
}

/// {@template unknownFailure}
///
/// Failure for any other uncaught error
///
/// {@endtemplate}
class UnknownFailure extends Failure {
  /// {@macro unknownFailure}
  const UnknownFailure([super.message = 'Something Went Wrong']);
}
