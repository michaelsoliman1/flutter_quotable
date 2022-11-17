import 'package:logger/logger.dart' as log;

class Logger {
  static final log.Logger logger = log.Logger();

  /// additional callback to be executed on error
  ///
  /// defaults to null
  static void Function(Object error, {StackTrace? stackTrace})? onError;

  /// additional callback to be executed on Severe Errors
  ///
  /// defaults to null
  static void Function(Object error, {StackTrace? stackTrace})? onSevere;

  static void init() {
    // init logger if needed
  }

  static void debug(Object object, {StackTrace? stackTrace}) {
    // ignore: avoid_dynamic_calls
    logger.d('', object, stackTrace);
  }

  static void info(Object object) {
    // ignore: avoid_dynamic_calls
    logger.i(object);
  }

  static void warning(Object object, {StackTrace? stackTrace}) {
    // ignore: avoid_dynamic_calls
    logger.w('', object, stackTrace);
  }

  /// a user made error, like bad api request, failed operations
  static void error(Object error, {StackTrace? stackTrace}) {
    // ignore: avoid_dynamic_calls
    logger.e('', error, stackTrace);
    onError?.call(error, stackTrace: stackTrace);
  }

  /// an unexpected error or exception, like platform exceptions etc.
  /// should not happen
  static void severe(Object error, {StackTrace? stackTrace}) {
    // ignore: avoid_dynamic_calls
    logger.wtf('', error, stackTrace);
    onSevere?.call(error, stackTrace: stackTrace);
  }
}
