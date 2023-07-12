import 'package:app_core/app_core.dart';
import 'package:app_data/src/core/mixins/repository_mixins.dart';
import 'package:app_data/src/data/author/data_sources/authors_remote_data_source.dart';
import 'package:app_domain/app_domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthorsRepository)
class AuthorsRepositoryImpl with RepositoryMixin implements AuthorsRepository {
  AuthorsRepositoryImpl(this._remoteDataSource);

  final AuthorsRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, Page<Author>>> authors({required int pageIndex, int limit = 20}) {
    return request(
      () => _remoteDataSource.fetchAuthors(pageIndex: pageIndex, limit: limit),
    );
  }
}
