import 'package:app_core/app_core.dart';
import 'package:app_data/src/core/mixins/repository_mixins.dart';
import 'package:app_data/src/data/quote/providers/quotes_remote_data_provider.dart';
import 'package:app_domain/app_domain.dart';

class QuotesRepositoryImpl with RepositoryMixin implements QuotesRepository {
  QuotesRepositoryImpl(this._remoteProvider);

  final QuotesRemoteDataProvider _remoteProvider;

  @override
  Future<Either<Failure, Page<Quote>>> quotes({required int page, int limit = 20}) {
    return request(
      () => _remoteProvider.fetchQuotes(page: page, limit: limit),
    );
  }

  @override
  Future<Quote> quote({required String id}) {
    return _remoteProvider.fetchQuote(id: id);
  }
}
