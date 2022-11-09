import 'package:awesome_quotes/app/quotes/presentation/quotes_screen.dart';
import 'package:awesome_quotes/app/root/root_screen.dart';
import 'package:awesome_quotes/router/app_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) => AppRouter());

class AppRouter {
  GoRouter get config => _router;

  final _router = GoRouter(
    initialLocation: Paths.home,
    routes: [
      ShellRoute(
        builder: (context, state, child) => RootScreen(child: child),
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) => const NoTransitionPage<void>(child: QuotesScreen()),
          ),
          GoRoute(
            path: '/account',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: Center(
                child: Text('Account'),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
