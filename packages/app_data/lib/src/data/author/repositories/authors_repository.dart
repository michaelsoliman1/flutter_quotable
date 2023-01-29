import 'package:app_core/app_core.dart';
import 'package:app_data/src/core/mixins/repository_mixins.dart';
import 'package:app_data/src/data/author/providers/authors_remote_data_provider.dart';
import 'package:app_domain/app_domain.dart';

class AuthorsRepositoryImpl with RepositoryMixin implements AuthorsRepository {
  AuthorsRepositoryImpl(this._remoteProvider);

  final AuthorsRemoteDataProvider _remoteProvider;

  @override
  Future<Either<Failure, Page<Author>>> authors({required int page, int limit = 20}) {
    return request(
      () => _remoteProvider.fetchAuthors(page: page, limit: limit),
    );
  }
}
