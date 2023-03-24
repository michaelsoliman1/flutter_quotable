import 'package:app_ui/src/theme/color_scheme.dart';
import 'package:flutter/material.dart';

/// Text Themes for the App UI.
class AppTextTheme {
  static TextTheme get lightTextTheme {
    return TextTheme(
      displayLarge: _AppTextStyle.displayLarge.apply(color: AppColorScheme.lightColorScheme.primary),
      displayMedium: _AppTextStyle.displayMedium.apply(color: AppColorScheme.lightColorScheme.primary),
      displaySmall: _AppTextStyle.displaySmall.apply(color: AppColorScheme.lightColorScheme.primary),
      headlineLarge: _AppTextStyle.headlineLarge.apply(color: AppColorScheme.lightColorScheme.primary),
      headlineMedium: _AppTextStyle.headlineMedium,
      headlineSmall: _AppTextStyle.headlineSmall,
      titleLarge: _AppTextStyle.titleLarge.apply(color: AppColorScheme.lightColorScheme.primary),
      titleMedium: _AppTextStyle.titleMedium.apply(color: AppColorScheme.lightColorScheme.primary),
      titleSmall: _AppTextStyle.titleSmall.apply(color: AppColorScheme.lightColorScheme.primary),
      bodyLarge: _AppTextStyle.bodyLarge.apply(color: AppColorScheme.lightColorScheme.primary),
      bodyMedium: _AppTextStyle.bodyMedium,
      bodySmall: _AppTextStyle.bodySmall,
      labelLarge: _AppTextStyle.labelLarge.apply(color: AppColorScheme.lightColorScheme.primary),
      labelMedium: _AppTextStyle.labelMedium,
      labelSmall: _AppTextStyle.labelSmall,
    );
  }
}

class _AppTextStyle {
  static const _baseTextStyle = TextStyle(
    package: 'app_ui',
  );

  static TextStyle get displayLarge {
    return _baseTextStyle.copyWith(
      fontFamily: 'Caveat',
    );
  }

  static TextStyle get displayMedium {
    return _baseTextStyle.copyWith(
      fontFamily: 'Caveat',
    );
  }

  static TextStyle get displaySmall {
    return _baseTextStyle.copyWith(
      fontFamily: 'Caveat',
    );
  }

  static TextStyle get headlineLarge {
    return _baseTextStyle.copyWith(
      fontFamily: 'Caveat',
    );
  }

  static TextStyle get headlineMedium {
    return _baseTextStyle.copyWith();
  }

  static TextStyle get headlineSmall {
    return _baseTextStyle.copyWith();
  }

  static TextStyle get titleLarge {
    return _baseTextStyle.copyWith(
      fontFamily: 'Caveat',
    );
  }

  static TextStyle get titleMedium {
    return _baseTextStyle.copyWith();
  }

  static TextStyle get titleSmall {
    return _baseTextStyle.copyWith();
  }

  static TextStyle get bodyLarge {
    return _baseTextStyle.copyWith(
      fontFamily: 'Caveat',
    );
  }

  static TextStyle get bodyMedium {
    return _baseTextStyle.copyWith();
  }

  static TextStyle get bodySmall {
    return _baseTextStyle.copyWith();
  }

  static TextStyle get labelLarge {
    return _baseTextStyle.copyWith(
      fontFamily: 'Caveat',
    );
  }

  static TextStyle get labelMedium {
    return _baseTextStyle.copyWith();
  }

  static TextStyle get labelSmall {
    return _baseTextStyle.copyWith();
  }
}
