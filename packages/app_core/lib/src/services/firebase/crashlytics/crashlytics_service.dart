import 'dart:async';

import 'package:app_core/src/logger/logger.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// Crash and error reporting service using [FirebaseCrashlytics]
///
/// You must call `Firebase.initializeApp` to use this
class CrashlyticsService {
  static FirebaseCrashlytics get instance => FirebaseCrashlytics.instance;

  static Future<void> setup() async {
    if (kIsWeb) return Future.value();
    if (kDebugMode) {
      unawaited(instance.setCrashlyticsCollectionEnabled(false));
    } else {
      unawaited(instance.setCrashlyticsCollectionEnabled(true));
    }

    FlutterError.onError = _recordFlutterError;

    Logger.onError = (error, {stackTrace}) => _recordError(
          error,
          stackTrace: stackTrace,
          information: ['LOGGER ERROR'],
        );

    // although passing `fatal = true` here will consider this as a crash,
    // but firebase sends error reports only when a crash happens (i.e passing `fatal = true`)
    // and we want to record severe errors right away and send them to firebase
    //
    // see https://firebase.google.com/docs/crashlytics/customize-crash-reports?authuser=0&hl=en&platform=flutter#report-caught-exceptions
    Logger.onSevere = (error, {stackTrace}) => _recordError(
          error,
          stackTrace: stackTrace,
          fatal: true,
          information: ['LOGGER SEVERE -not a crash-'],
        );
  }

  static Future<void> _recordError(
    dynamic error, {
    StackTrace? stackTrace,
    dynamic reason,
    Iterable<Object> information = const [],
    bool fatal = false,
  }) {
    if (kIsWeb) return Future.value();
    return instance.recordError(
      error,
      stackTrace,
      reason: reason,
      information: information,
      fatal: fatal,
      printDetails: false,
    );
  }

  static Future<void> _recordFlutterError(FlutterErrorDetails details) {
    FlutterError.presentError(details);
    return _recordError(
      details,
      information: ['FLUTTER ERROR'],
    );
  }

  static Future<void> handleZoneError(dynamic error, StackTrace stackTrace) {
    return _recordError(
      error,
      stackTrace: stackTrace,
      fatal: true,
      information: ['ZONE ERROR'],
    );
  }

  static Future<void> setUserIdentifier(String identifier) {
    return instance.setUserIdentifier(identifier);
  }

  static void testCrash() {
    instance.crash();
  }
}
