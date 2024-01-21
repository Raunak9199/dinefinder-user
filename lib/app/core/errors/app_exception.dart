import 'package:dinefinder_user/app/core/core.dart';

abstract class AppException implements Exception {
  final String message;
  AppException(this.message);

  @override
  String toString() => message;
}

class InternalErrorException extends AppException {
  InternalErrorException([String? message])
      : super(message ?? internalErrorExceptionMessage);
}

class NetworkException extends AppException {
  NetworkException([String? message])
      : super(message ?? networkExceptionMessage);
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message ?? badRequestExceptionMessage);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message ?? unauthorisedExceptionMessage);
}

class NotFoundException extends AppException {
  NotFoundException([String? message])
      : super(message ?? notFoundExceptionMessage);
}

class NullDataException extends AppException {
  NullDataException([String? message])
      : super(message ?? notFoundExceptionMessage);
}

class UploadDocsException extends AppException {
  UploadDocsException([String? message])
      : super(message ?? notFoundExceptionMessage);
}

class FutureDateException extends AppException {
  FutureDateException([String? message])
      : super(message ?? futureDateException);
}

class AppUpdateException extends AppException {
  AppUpdateException({String? message}) : super(message ?? appUpdateException);
}
