import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quotable/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlutterQuotable extends ConsumerWidget {
  const FlutterQuotable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Quotable',
      theme: AppTheme.light,
      routerConfig: router.config,
    );
  }
}
