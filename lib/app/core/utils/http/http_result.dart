///Clase [HttpResult<T>]
///
///Recibe la información de tipo genérico [data], el código de estatus
///[statusCode] y el tipo de error [error] en caso de tenerlo
class HttpResult<T> {
  final T? data;
  final int statusCode;
  final HttpError? error;

  HttpResult({
    required this.data,
    required this.error,
    required this.statusCode,
  });
}

///Clase [HttpError]
///
///Recibe la excepción [exception] la cual puede ser nula, el [stackTrace] y
///la información [data]
class HttpError {
  final Object? exception;
  final StackTrace stackTrace;
  final dynamic data;

  HttpError({
    required this.exception,
    required this.stackTrace,
    required this.data,
  });
}
