abstract class AppFailure {
  String message;
  AppFailure(this.message);
}

class InternalErrorFailure extends AppFailure {
  InternalErrorFailure(super.message);
}

class NetworkFailure extends AppFailure {
  NetworkFailure(super.message);
}

class BadRequestFailure extends AppFailure {
  BadRequestFailure(super.message);
}

class UnauthorisedFailure extends AppFailure {
  UnauthorisedFailure(super.message);
}

class NotFoundFailure extends AppFailure {
  NotFoundFailure(super.message);
}

class NullDataFailure extends AppFailure {
  NullDataFailure(super.message);
}
