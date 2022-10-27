class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

//*! checar no comprueba la conexion a internet
class FechtDataException extends AppException {
  FechtDataException([String? message])
      : super(message, 'Otro Error durante la comunicacion');
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, 'Solicitud no Invalidad');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message, 'Solicitud no autorizada');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Entrada Inválida');
}

class MessageApiResponseError extends AppException {
  MessageApiResponseError([String? message])
      : super(message, 'Error del servidor');
}
