import 'package:app_ui/src/theme/color_scheme.dart';
import 'package:app_ui/src/theme/text_theme.dart';
import 'package:flutter/material.dart';

/// Namespace for the App [ThemeData].
class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColorScheme.lightColorScheme,
      textTheme: AppTextTheme.lightTextTheme,
      appBarTheme: AppBarTheme(
        foregroundColor: AppColorScheme.lightColorScheme.secondary,
      ),
    );
  }
}
