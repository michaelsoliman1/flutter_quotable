import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

/// {@template internetConnection}
///
/// A service for checking internet connection
///
/// {@endtemplate}
class InternetConnectionService {
  /// {@macro internetConnection}
  InternetConnectionService();

  final _internetChecker = InternetConnectionChecker();
  final _listeners = <StreamSubscription<InternetConnectionStatus>>[];

  /// check if the device is connected to the internet
  Future<bool> get hasConnection => _internetChecker.hasConnection;

  /// add listener to the connection checker stream
  void addListener(void Function(InternetConnectionStatus) connectionListener) {
    final listener = _internetChecker.onStatusChange.listen(connectionListener);
    _listeners.add(listener);
  }

  /// dispose all listener to connection checker stream
  void dispose() {
    for (final listener in _listeners) {
      listener.cancel();
    }
  }
}
