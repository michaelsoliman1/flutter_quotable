import 'package:flutter/material.dart';

/// App Snackbars
class SnackBars {
  /// show an info snackbar, e.g after a success operation
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
