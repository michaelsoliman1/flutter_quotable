import 'package:app_domain/app_domain.dart';

import 'package:awesome_quotes/locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quotesProvider = FutureProvider(
  (ref) => locator<QuotesRepository>().quotes(page: 1),
);
