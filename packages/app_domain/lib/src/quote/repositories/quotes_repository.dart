import 'package:app_core/app_core.dart';
import 'package:app_domain/src/quote/entities/entities.dart';

abstract class QuotesRepository {
  Future<Either<Failure, Page<Quote>>> quotes({
    required int pageIndex,
    int limit = 20,
  });

  Future<Quote> quote({required String id});
}
