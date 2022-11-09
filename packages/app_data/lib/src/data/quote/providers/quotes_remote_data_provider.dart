import 'package:app_data/src/data/quote/models/quote_model.dart';
import 'package:app_data/src/services/http/http_service.dart';

class QuotesRemoteDataProvider {
  QuotesRemoteDataProvider(this._httpService);

  // ignore: unused_field
  final HttpService _httpService;

  Future<List<QuoteModel>> fetchQuotes() {
    throw UnimplementedError();
  }

  Future<QuoteModel> fetchQuote({required String id}) {
    throw UnimplementedError();
  }
}
