import 'package:app_core/app_core.dart';
import 'package:app_data/src/data/quote/data_sources/apis.dart';
import 'package:app_data/src/data/quote/models/quote_model.dart';
import 'package:app_data/src/services/http/http_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class QuotesRemoteDataSource {
  QuotesRemoteDataSource(this._httpService);

  final HttpService _httpService;

  Future<Page<QuoteModel>> fetchQuotes({required int pageIndex, int limit = 20}) async {
    final response = await _httpService.requestPage(
      QuotesApis.quotes,
      pageIndex: pageIndex,
      limit: limit,
    );
    return Page(
      totalCount: response.totalCount,
      pageIndex: response.pageIndex,
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
