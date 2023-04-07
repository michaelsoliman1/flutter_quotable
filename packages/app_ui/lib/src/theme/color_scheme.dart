import 'package:flutter/material.dart';

/// Color Schemes for the App UI.
class AppColorScheme {
  static final lightColorScheme = ColorScheme.fromSeed(
    seedColor: seed,
    surface: const Color(0xFFEBF6F2),
  );

  static final darkColorScheme = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: Brightness.dark,
  );

  /// Seed Color for ColorScheme
  static const Color seed = Color(0xFF003F35);
}
