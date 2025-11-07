import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/network/new/api/api_result.dart';

/// This class wraps responses using [Either] to handle success and failure cases consistently.
///
/// Network and unexpected errors thrown by the API service are caught and
/// converted into domain-level [Failure] objects via [BaseRepository.call].
abstract class BaseRepository {
  /// Executes [action], returning [Right] with the result on success,
  /// or [Left] with a [Failure] if an error occurs.
  Future<ApiResult<T>> call<T>(Future<T> Function() action) async {
    try {
      final result = await action();
      return ApiResult.success(result);
    } on AppException catch (e, _) {
      final failure = _mapAppExceptionToFailure(e);
      return ApiResult.failure(failure);
    }
  }
}

Failure _mapAppExceptionToFailure(Object e) {
  String message = e.toString();

  if (e is AppException) message = e.message;

  if (e is ServerException) {
    return ServerFailure(message);
  } else if (e is ClientException) {
    return ClientFailure(message);
  } else if (e is NetworkException) {
    return NetworkFailure(message);
  } else if (e is LocalDatabaseException) {
    return LocalDatabaseFailure(message);
  } else if (e is UnexpectedException) {
    return UnexpectedFailure(message);
  } else {
    return UnexpectedFailure(message);
  }
}
