import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quotable/locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> bootstrap(Widget Function() builder) async {
  runZonedGuarded<void>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await locator.setup();

      runApp(
        ProviderScope(
          child: builder(),
        ),
      );
    },
    (error, stack) {
      Logger.severe(error, stackTrace: stack);
    },
  );
}
