import 'package:quotes/app/quotes/data/providers/quotes_remote_provider.dart';
import 'package:quotes/app/quotes/domain/domain.dart';

class QuotesRepositoryImpl implements QuotesRepository {
  QuotesRepositoryImpl(this._apiProvider);

  final QuotesRemoteProvider _apiProvider;

  @override
  Future<List<Quote>> quotes() {
    return _apiProvider.fetchQuotes();
  }

  @override
  Future<Quote> quote({required String id}) {
    return _apiProvider.fetchQuote(id: id);
  }
}
