import 'package:app_core/app_core.dart';
import 'package:app_data/src/data/quote/models/quote_model.dart';
import 'package:app_data/src/services/http/http_service.dart';

class QuotesRemoteDataProvider {
  QuotesRemoteDataProvider(this._httpService);

  final HttpService _httpService;

  Future<Page<QuoteModel>> fetchQuotes({required int page, int limit = 20}) async {
    final response = await _httpService.requestPage(
      '/quotes',
      page: page,
      limit: limit,
    );
    return Page(
      totalCount: response.totalCount,
      pageIndex: response.page,
      totalPages: response.totalPages,
      items: response.results.map(QuoteModel.fromJson).toList(),
    );
  }

  Future<QuoteModel> fetchQuote({required String id}) async {
    final response = await _httpService.get(
      '/quotes/$id',
    );
    return QuoteModel.fromJson(response.result);
  }
}
