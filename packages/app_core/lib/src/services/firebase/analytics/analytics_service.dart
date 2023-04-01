import 'package:firebase_analytics/firebase_analytics.dart';

/// Analytics service using [FirebaseAnalytics]
///
/// You must call `Firebase.initializeApp` to use this
class AnalyticsService {
  AnalyticsService._();

  static FirebaseAnalytics get instance => FirebaseAnalytics.instance;

  static Future<void> logAppOpen() {
    return instance.logAppOpen();
  }
}
