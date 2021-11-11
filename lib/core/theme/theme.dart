import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: 'Poppins',
    textTheme: _lightTextTheme,
    colorScheme: _lightColorScheme,
    backgroundColor: _lightColorScheme.background,
    primaryColor: _lightColorScheme.primary,
    accentColor: _lightColorScheme.secondary,
    appBarTheme: AppBarTheme(
      elevation: 1,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: _lightColorScheme.secondary,
      elevation: 10,
    ),
    iconTheme: IconThemeData(color: _lightColorScheme.primary),
  );

  static final _lightColorScheme = ColorScheme(
    primary: Color(0xFF00ACC1),
    primaryVariant: Color(0xFF007E8F),
    secondary: Color(0xFF2003B42),
    secondaryVariant: Color(0xFF1C545C),
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFFFFFFF),
    error: Color(0xFF751B0C),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF2003B42),
    onBackground: Color(0xFF2003B42),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );

  static final _lightTextTheme = TextTheme(
    headline5: TextStyle(fontWeight: _semiBold, fontFamily: 'DancingScript'),
    headline6: TextStyle(fontWeight: _bold),
    subtitle1: TextStyle(fontWeight: _medium),
    bodyText1: TextStyle(fontWeight: _medium),
    bodyText2: TextStyle(fontWeight: _regular, fontSize: 14.0, fontFamily: 'DancingScript'),
  );

  static const _regular = FontWeight.w500;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;
}
