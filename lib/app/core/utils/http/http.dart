import 'dart:developer';

import 'http_method.dart';
import 'send_request.dart';
import 'parse_response_body.dart';
import 'http_result.dart';

///Función para parsear el dato generico [T]
typedef Parser<T> = T Function(dynamic data);

///La clase Http sirve para hacer las consultas a la API
///Recibe por parametro la dirección base
///```
/// final String baseUrl;
///```
///Tiene por método
///```
///Future<HttpResult<T>> request<T>(
/// String path, //ruta
///   {
///     HttpMethod method = HttpMethod.get,//Por defecto, petición por método GET
///     Map<String, String> headers = const {},//Por defecto, vacíos
///     Map<String, Object> queryParameters = const {},//Por defecto, vacíos
///     dynamic body, //Cuerpo de la petición
///     Parser<T>? parser, //Función para parsear el dato genérico T
///     Duration timeOut = const Duration(seconds: 10), //Tiempo max de duración
///   }
///)
///```
///
class Http {
  final String baseUrl;

  Http({this.baseUrl = ''});

  ///Petición HTTP
  ///
  ///NOTA: *Cuando se realiza con método GET, no usar [body],
  ///usar queryParameters*
  ///
  ///EJEMPLO:
  ///http://www.api.mx/api/cuenta   //Esto es [path]
  ///```
  /// ?item=1&item2='hola'          //Estos son queryParameters
  /// ```
  /// GET, POST, PUT, PATCH, DELETE //Estos son algunos métodos de petición http
  ///
  /// [body] va oculto en la URL pero se puede ver en las DevTools
  ///
  /// [           path           ][ queryParameters ]
  ///
  /// http://www.api.mx/api/cuenta?item=1&item2='hola'
  ///
  Future<HttpResult<T>> request<T>(
    String path, {
    HttpMethod method = HttpMethod.get,
    Map<String, String> headers = const {},
    Map<String, Object> queryParameters = const {},
    dynamic body,
    Parser<T>? parser,
    Duration timeOut = const Duration(seconds: 60),
  }) async {
    int? statusCode; //Código de estatus de petición, ej. 200, 404, 500, etc.
    dynamic data; //datos de retorno
    try {
      late Uri url; //Url
      if (path.startsWith('http://') || path.startsWith('https://')) {
        url = Uri.parse(path); //parseo de url
      } else {
        url = Uri.parse('$baseUrl$path'); //se agrega la base de url y se parsea
      }

      //Si los parametros no estan vacíos, se añaden
      if (queryParameters.isNotEmpty) {
        url.replace(
          queryParameters: {
            ...url.queryParameters,
            ...queryParameters,
          },
        );
      }
      //Se envía la petición
      final response = await sendRequest(
        url: url,
        method: method,
        headers: headers,
        body: body,
        timeOut: timeOut,
      );

      //Se parsea el cuerpo de la respuesa
      data = parseResponseBody(response.body);
      //Se obtiene el código de respuesta
      statusCode = response.statusCode;
      if (statusCode >= 400) {
        //Si es error, se retorna
        throw HttpError(
          data: data,
          stackTrace: StackTrace.current,
          exception: null,
        );
      }
      //Si la petición es correcta, se retorna
      return HttpResult<T>(
        data: parser != null ? parser(data) : data, //Se parsea la información
        statusCode: statusCode,
        error: null,
      );
    } catch (e, s) {
      //Si se rompe la petición y es un HttpError, se manda el resultado del eror
      if (e is HttpError) {
        log(
          "class Http: "
          "Error: ${e.exception} -- StatusCode: $statusCode",
        );
        return HttpResult<T>(
          data: null,
          error: e,
          statusCode: statusCode!,
        );
      }
      //Si se rompe, pero no es de tipo HttpError, se manda la respuesta
      log(
        "class Http: "
        "Error: $e -- StackTrace: $s",
      );
      return HttpResult<T>(
        data: null,
        error: HttpError(
          data: data,
          exception: e,
          stackTrace: s,
        ),
        statusCode: -1,
      );
    }
  }
}
