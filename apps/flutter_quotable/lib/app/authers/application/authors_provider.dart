import 'package:app_core/app_core.dart';
import 'package:app_domain/app_domain.dart';
import 'package:app_ui/app_ui.dart';

import 'package:flutter_quotable/locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authorsProvider = Provider((ref) {
  return AuthorsProvider(locator());
});

class AuthorsProvider extends PagingProvider<Author> {
  AuthorsProvider(this._repository);

  final AuthorsRepository _repository;

  @override
  NewPageCallback<Author> get pageRequest => _fetchAuthors;

  Future<Either<Failure, Page<Author>>> _fetchAuthors(int pageIndex) async {
    return _repository.authors(pageIndex: pageIndex);
  }
}
