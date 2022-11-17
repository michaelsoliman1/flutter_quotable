import 'package:app_data/src/data/quote/providers/quotes_remote_data_provider.dart';
import 'package:app_domain/app_domain.dart';

class QuotesRepositoryImpl implements QuotesRepository {
  QuotesRepositoryImpl(this._remoteProvider);

  final QuotesRemoteDataProvider _remoteProvider;

  @override
  Future<List<Quote>> quotes({required int page, int limit = 20}) {
    return _remoteProvider.fetchQuotes(page: page, limit: limit);
  }

  @override
  Future<Quote> quote({required String id}) {
    return _remoteProvider.fetchQuote(id: id);
  }
}
