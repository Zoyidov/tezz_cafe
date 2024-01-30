abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class NoInternetFailure extends Failure {
  const NoInternetFailure(super.message);
}

class ParseFailure extends Failure {
  const ParseFailure(super.message);
}

// failure for status code not 200
class StatusFailure extends Failure {
  const StatusFailure(super.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}