// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_data/src/data/author/data_sources/authors_remote_data_source.dart'
    as _i8;
import 'package:app_data/src/data/author/repositories/authors_repository.dart'
    as _i9;
import 'package:app_data/src/data/quote/data_sources/quotes_remote_data_source.dart'
    as _i5;
import 'package:app_data/src/data/quote/repositories/quotes_repository.dart'
    as _i7;
import 'package:app_data/src/locator/env.dart' as _i10;
import 'package:app_data/src/services/http/dio_client/dio_client.dart' as _i4;
import 'package:app_data/src/services/http/http_service.dart' as _i3;
import 'package:app_domain/app_domain.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt setup({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final envModule = _$EnvModule();
    gh.factory<String>(
      () => envModule.url,
      instanceName: 'baseUrl',
    );
    gh.singleton<_i3.HttpService>(
        () => _i4.DioClient(gh<String>(instanceName: 'baseUrl')));
    gh.lazySingleton<_i5.QuotesRemoteDataSource>(
        () => _i5.QuotesRemoteDataSource(gh<_i3.HttpService>()));
    gh.lazySingleton<_i6.QuotesRepository>(
        () => _i7.QuotesRepositoryImpl(gh<_i5.QuotesRemoteDataSource>()));
    gh.lazySingleton<_i8.AuthorsRemoteDataSource>(
        () => _i8.AuthorsRemoteDataSource(gh<_i3.HttpService>()));
    gh.lazySingleton<_i6.AuthorsRepository>(
        () => _i9.AuthorsRepositoryImpl(gh<_i8.AuthorsRemoteDataSource>()));
    return this;
  }
}

class _$EnvModule extends _i10.EnvModule {}
