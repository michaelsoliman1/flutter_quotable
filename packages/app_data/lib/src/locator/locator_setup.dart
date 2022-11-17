import 'package:app_data/src/data/quote/providers/quotes_remote_data_provider.dart';
import 'package:app_data/src/data/quote/repositories/quotes_repository.dart';
import 'package:app_data/src/locator/constants.dart';
import 'package:app_data/src/services/http/dio_client/dio_client.dart';
import 'package:app_data/src/services/http/http_service.dart';
import 'package:app_domain/app_domain.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator
    // core dependencies
    ..registerFactory(() => 'https://quotable.io/', instanceName: baseUrlInstanceName)
    ..registerSingleton<HttpService>(
      DioClient(
        locator(instanceName: baseUrlInstanceName),
        interceptors: [LogInterceptor()],
      ),
    )
    // quotes related dependencies
    ..registerLazySingleton(() => QuotesRemoteDataProvider(locator()))
    ..registerLazySingleton<QuotesRepository>(() => QuotesRepositoryImpl(locator()));
}
