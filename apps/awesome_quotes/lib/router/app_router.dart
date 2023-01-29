import 'package:awesome_quotes/app/authers/presentation/authors_screen.dart';
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
    initialLocation: Paths.quotes,
    routes: [
      ShellRoute(
        builder: (context, state, child) => RootScreen(child: child),
        routes: [
          GoRoute(
            path: Paths.quotes,
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: QuotesScreen(),
            ),
          ),
          GoRoute(
            path: Paths.authors,
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: AuthorsScreen(),
            ),
          ),
          GoRoute(
            path: Paths.account,
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
