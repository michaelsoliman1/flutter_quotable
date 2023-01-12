import 'package:app_core/app_core.dart';

/// callback to fetch a new page with [pageIndex]
typedef NewPageCallback<T> = Future<Either<Failure, Page<T>>> Function(int pageIndex);
