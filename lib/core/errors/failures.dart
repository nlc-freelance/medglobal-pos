abstract class Failure {
  final String message;
  const Failure(this.message);
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure(super.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure(super.message);
}
