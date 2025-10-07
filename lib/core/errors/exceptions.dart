abstract class AppException implements Exception {
  final String message;
  final int? code;

  const AppException(this.message, {this.code});

  @override
  String toString() => message;
}

class ServerException extends AppException {
  ServerException(super.message, {super.code});
}

class ClientException extends AppException {
  ClientException(super.message, {super.code});
}

class NetworkException extends AppException {
  NetworkException() : super('No internet connection. Please check your network and try again.');
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
