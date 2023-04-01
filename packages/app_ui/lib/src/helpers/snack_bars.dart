import 'package:app_core/app_core.dart';
import 'package:app_ui/src/keys/ui_keys.dart';
import 'package:app_ui/src/theme/theme.dart';
import 'package:flutter/material.dart';

class SnackBars {
  /// helper function to show error snackbar,
  /// must assign [UIKeys.rootMessangerKey] to MaterialApp to work without context
  static void showSnackBar({required String message, BuildContext? context}) {
    _getActiveState(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );
  }

  /// helper function to show error snackbar,
  /// must assign [UIKeys.rootMessangerKey] to MaterialApp to work without context
  static void showErrorSnackBar({required String message, BuildContext? context}) {
    if (message.isEmpty) {
      Logger.warning('trying to show a snackbar with an empty message');
      return;
    }
    _getActiveState(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(message),
              ),
              const Icon(
                Icons.error_outline_outlined,
                color: Colors.white,
              ),
            ],
          ),
          backgroundColor: AppTheme.light.colorScheme.error,
        ),
      );
  }

  static ScaffoldMessengerState _getActiveState(BuildContext? context) {
    assert(
      context != null || UIKeys.rootMessangerKey.currentState != null,
      'You must pass the context or assign [UIKeys.rootMessangerKey] to MaterialApp',
    );
    if (context != null) {
      return ScaffoldMessenger.of(context);
    } else {
      return UIKeys.rootMessangerKey.currentState!;
    }
  }
}
