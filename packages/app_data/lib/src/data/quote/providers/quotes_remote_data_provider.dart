import 'package:app_data/src/data/quote/models/quote_model.dart';
import 'package:app_data/src/services/http/http_service.dart';

class QuotesRemoteDataProvider {
  QuotesRemoteDataProvider(this._httpService);

  // ignore: unused_field
  final HttpService _httpService;

  Future<List<QuoteModel>> fetchQuotes({required int page, int limit = 20}) async {
    final response = await _httpService.requestList(
      '/quotes',
      page: page,
      limit: limit,
    );
    return response.result.map(QuoteModel.fromJson).toList();
  }

  Future<QuoteModel> fetchQuote({required String id}) async {
    final response = await _httpService.get(
      '/quotes/$id',
    );
    return QuoteModel.fromJson(response.result);
  }
}
