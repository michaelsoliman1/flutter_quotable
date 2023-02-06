import 'package:app_core/app_core.dart';
import 'package:app_domain/app_domain.dart';
import 'package:app_ui/app_ui.dart';

import 'package:flutter_quotable/locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quotesProvider = Provider((ref) {
  return QuotesProvider(locator());
});

class QuotesProvider extends PagingProvider<Quote> {
  QuotesProvider(this._repository);

  final QuotesRepository _repository;

  @override
  NewPageCallback<Quote> get pageRequest => _fetchQuotes;

  Future<Either<Failure, Page<Quote>>> _fetchQuotes(int pageIndex) async {
    return _repository.quotes(page: pageIndex);
  }
}
