import 'package:app_ui/src/theme/color_scheme.dart';
import 'package:app_ui/src/theme/text_theme.dart';
import 'package:flutter/material.dart';

/// Namespace for the App [ThemeData].
class AppTheme {
  static ThemeData get standard {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColorScheme.lightColorScheme,
      textTheme: AppTextTheme.lightTextTheme,
    );
  }
}
