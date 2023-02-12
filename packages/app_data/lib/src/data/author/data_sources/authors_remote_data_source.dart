import 'package:app_core/app_core.dart';
import 'package:app_data/src/data/author/data_sources/apis.dart';
import 'package:app_data/src/data/author/models/author_model.dart';
import 'package:app_data/src/services/http/http_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AuthorsRemoteDataSource {
  AuthorsRemoteDataSource(this._httpService);

  final HttpService _httpService;

  Future<Page<AuthorModel>> fetchAuthors({required int page, int limit = 20}) async {
    final response = await _httpService.requestPage(
      AuthorsApis.authors,
      page: page,
      limit: limit,
    );
    return Page(
      totalCount: response.totalCount,
      pageIndex: response.page,
      totalPages: response.totalPages,
      items: response.results.map(AuthorModel.fromJson).toList(),
    );
  }
}
