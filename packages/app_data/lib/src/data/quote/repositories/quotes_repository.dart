import 'package:app_data/src/data/quote/providers/quotes_remote_data_provider.dart';
import 'package:app_domain/app_domain.dart';

class QuotesRepositoryImpl implements QuotesRepository {
  QuotesRepositoryImpl(this._remoteProvider);

  final QuotesRemoteDataProvider _remoteProvider;

  @override
  Future<List<Quote>> quotes() {
    return _remoteProvider.fetchQuotes();
  }

  @override
  Future<Quote> quote({required String id}) {
    return _remoteProvider.fetchQuote(id: id);
  }
}
