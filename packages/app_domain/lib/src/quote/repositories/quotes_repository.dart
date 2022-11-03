import 'package:app_domain/src/quote/entities/entities.dart';

abstract class QuotesRepository {
  Future<List<Quote>> quotes();
  Future<Quote> quote({required String id});
}
