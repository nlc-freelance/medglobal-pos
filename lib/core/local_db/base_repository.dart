import 'package:dartz/dartz.dart';
// import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';

/// This class wraps responses using [Either] to handle success and failure cases consistently.
///
/// Network and unexpected errors thrown by the API service are caught and
/// converted into domain-level [Failure] objects via [BaseRepository.call].
abstract class BaseRepository {
  /// Executes [action], returning [Right] with the result on success,
  /// or [Left] with a [Failure] if an error occurs.
  Future<Either<Failure, T>> call<T>(Future<T> Function() action) async {
    try {
      final result = await action();
      return Right(result);
    } catch (e) {
      final failure = _mapAppExceptionToFailure(e);
      return Left(failure);
    }
    // } on ServerException catch (e) {
    //   return Left(ServerFailure(e.message));
    // } on UnexpectedException catch (e) {
    //   return Left(UnexpectedFailure(e.message));
    // } catch (e) {
    //   return Left(UnexpectedFailure(e.toString()));
    // }
  }
}

Failure _mapAppExceptionToFailure(Object e) {
  if (e is ServerException) {
    return ServerFailure('Server error: ${e.message}');
    // } else if (e is SqliteException) {
    //   return LocalDatabaseFailure('Database error: ${e.message}');
  }
  // else if (e is DriftWrappedException) {
  //   return LocalDatabaseFailure('Query failed: ${e.message}');
  // } else if (e is InvalidDataException) {
  //   return LocalDatabaseFailure('Data mapping error: ${e.toString()}');
  // }
  else if (e is UnexpectedException) {
    return UnexpectedFailure('Unexpected error: ${e.toString()}');
  } else {
    return UnexpectedFailure('Unknown error: ${e.toString()}');
  }
}
