import 'package:app_core/src/models/error/failures.dart';

/// {@template serverFailure}
///
/// Failure for server requests errors, such as bad requests
///
/// {@endtemplate}
class ServerFailure extends Failure {
  /// {@macro serverFailure}
  const ServerFailure(super.message);
}
