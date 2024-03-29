import 'package:app_core/app_core.dart';
import 'package:app_data/src/services/http/models/models.dart';

typedef RequestCallback<T> = Future<T> Function();

mixin RepositoryMixin {
  Future<Either<Failure, T>> request<T>(RequestCallback<T> request) async {
    try {
      final response = await request();
      return Right(response);
    } on ServerException catch (e) {
      return Left(_mapServerExceptionToFailure(e));
    } on PlatformException catch (e) {
      return Left(_mapPlatformExceptionToFailure(e));
    } catch (e, s) {
      Logger.severe(e, stackTrace: s);
      return const Left(UnknownFailure());
    }
  }

  /// maps [ServerException] to a specific failure
  Failure _mapServerExceptionToFailure(ServerException e) {
    return ServerFailure(e.message);
  }

  /// maps [PlatformException] to a specific failure
  Failure _mapPlatformExceptionToFailure(PlatformException e) {
    return const PlatformFailure();
  }
}
