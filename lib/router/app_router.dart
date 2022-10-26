import 'package:flutter/material.dart';

import '../app/controllers/app_state_controller.dart';
import '../app/controllers/favorite_quotes_controller.dart';
import '../app/controllers/quotes_controller.dart';
import '../app/home_screen.dart';
import '../app/screens/splash/splash_screen.dart';

class AppRouter extends RouterDelegate with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateController appStateController;
  final QuotesController quotesController;
  final FavoriteQuotesController favoriteQuotesController;

  AppRouter({
    required this.appStateController,
    required this.quotesController,
    required this.favoriteQuotesController,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateController.addListener(notifyListeners);
    quotesController.addListener(notifyListeners);
    favoriteQuotesController.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateController.removeListener(notifyListeners);
    quotesController.removeListener(notifyListeners);
    favoriteQuotesController.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!appStateController.isInitialized) SplashScreen.page(),
        if (appStateController.isInitialized) HomeScreen.page(appStateController.selectedTab),
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
