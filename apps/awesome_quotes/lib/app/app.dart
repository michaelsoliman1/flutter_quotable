import 'package:app_ui/app_ui.dart';
import 'package:awesome_quotes/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuotesApp extends ConsumerWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Awesome Quotes',
      theme: AppTheme.standard,
      routerConfig: router.config,
    );
  }
}
