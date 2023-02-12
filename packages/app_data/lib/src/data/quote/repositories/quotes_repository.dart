import 'package:app_core/app_core.dart';
import 'package:app_data/src/core/mixins/repository_mixins.dart';
import 'package:app_data/src/data/quote/data_sources/quotes_remote_data_source.dart';
import 'package:app_domain/app_domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: QuotesRepository)
class QuotesRepositoryImpl with RepositoryMixin implements QuotesRepository {
  QuotesRepositoryImpl(this._remoteDataSource);

  final QuotesRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, Page<Quote>>> quotes({required int page, int limit = 20}) {
    return request(
      () => _remoteDataSource.fetchQuotes(page: page, limit: limit),
    );
  }

  @override
  Future<Quote> quote({required String id}) {
    return _remoteDataSource.fetchQuote(id: id);
  }
}
