import 'package:quotes/app/quotes/domain/entities/quote.dart';

abstract class QuotesRepository {
  Future<List<Quote>> quotes();
  Future<Quote> quote({required String id});
}
