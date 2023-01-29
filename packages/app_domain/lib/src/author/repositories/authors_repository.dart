import 'package:app_core/app_core.dart';
import 'package:app_domain/src/author/entities/entities.dart';

abstract class AuthorsRepository {
  Future<Either<Failure, Page<Author>>> authors({
    required int page,
    int limit = 20,
  });
}
