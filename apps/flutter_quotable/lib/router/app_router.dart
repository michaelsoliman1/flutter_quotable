import 'package:flutter/material.dart';
import 'package:flutter_quotable/app/authers/presentation/authors_screen.dart';
import 'package:flutter_quotable/app/quotes/presentation/quotes_screen.dart';
import 'package:flutter_quotable/app/root/root_screen.dart';
import 'package:flutter_quotable/router/app_paths.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
