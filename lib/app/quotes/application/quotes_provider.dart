import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotes/app/quotes/data/providers/quotes_api_provider.dart';
import 'package:quotes/app/quotes/data/repositories/quotes_repository.dart';

final quotesProvider = FutureProvider(
  (ref) => QuotesRepositoryImpl(QuotesRemoteProvider()).quotes(),
);
