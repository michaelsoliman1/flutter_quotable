import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotes/core/theme/theme.dart';
import 'package:quotes/router/router.dart';

class QuotesApp extends ConsumerWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Quotes App',
      theme: AppTheme.lightTheme,
      routerConfig: router.config,
    );
  }
}
