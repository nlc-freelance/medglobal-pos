abstract class AppException implements Exception {
  final String messsage;
  const AppException(this.messsage);
}

class ServerException extends AppException {
  ServerException(super.messsage);
}

class NetworkException extends AppException {
  NetworkException(super.messsage);
}

class UnexpectedException extends AppException {
  UnexpectedException(super.messsage);
}
