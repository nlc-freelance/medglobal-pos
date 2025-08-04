abstract class AppException implements Exception {
  final String message;
  const AppException(this.message);

  @override
  String toString() => message;
}

class ServerException extends AppException {
  ServerException(super.message);
}

class NetworkException extends AppException {
  NetworkException(super.message);
}

class LocalDatabaseException extends AppException {
  LocalDatabaseException(super.message);
}

class SyncException extends AppException {
  SyncException(super.message);
}

class UnexpectedException extends AppException {
  UnexpectedException(super.message);
}
