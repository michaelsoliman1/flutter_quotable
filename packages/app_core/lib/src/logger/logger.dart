class Logger {
  //TODO add your own logger
  static dynamic get logger => throw UnimplementedError();

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
    logger.debug(object);
  }

  static void info(Object object) {
    // ignore: avoid_dynamic_calls
    logger.info(object);
  }

  static void warning(Object object, {StackTrace? stackTrace}) {
    // ignore: avoid_dynamic_calls
    logger.warning(object, stackTrace: stackTrace);
  }

  /// a user made error, like bad api request, failed operations
  static void error(Object error, {StackTrace? stackTrace}) {
    // ignore: avoid_dynamic_calls
    logger.error(error, stackTrace: stackTrace);
    onError?.call(error, stackTrace: stackTrace);
  }

  /// an unexpected error or exception, like platform exceptions etc.
  /// should not happen
  static void severe(Object error, {StackTrace? stackTrace}) {
    // ignore: avoid_dynamic_calls
    logger.error(error, stackTrace: stackTrace);
    onSevere?.call(error, stackTrace: stackTrace);
  }
}
