import 'dart:async';

import 'package:flutter/material.dart';

class BottomTab {
  static const int quotes = 0;
  static const int favorites = 1;
}

class AppStateController extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  bool _onboardingComplete = false;
  int _selectedTab = BottomTab.quotes;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;
  int get selectedTab => _selectedTab;

  void initializeApp() {
    Timer(
      const Duration(seconds: 3),
      () {
        _initialized = true;
        notifyListeners();
      },
    );
  }

  void login(String username, String password) {
    _loggedIn = true;
    notifyListeners();
  }

  void completeOnboarding() {
    _onboardingComplete = true;
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  void goToRecipes() {
    _selectedTab = BottomTab.favorites;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    _onboardingComplete = false;
    _initialized = false;
    _selectedTab = 0;

    initializeApp();
    notifyListeners();
  }
}
