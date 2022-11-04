import 'package:app_core/app_core.dart';

/// {@template serverFailure}
///
/// Failure for server requests errors, such as bad requests
///
/// {@endtemplate}
class ServerFailure extends Failure {
  /// {@macro serverFailure}
  const ServerFailure(super.message);
}
