class AppException implements Exception {
  final _message;
  final _prefix;

  AppException(this._message, this._prefix);
  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FitchDataException extends AppException {
  FitchDataException([String? message]) : super(message, "Error During Communication");
}

class BadResponseException extends AppException {
  BadResponseException([String? message]) : super(message, "Invalid request");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message]) : super(message, "Unauthorized request");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid input");
}

