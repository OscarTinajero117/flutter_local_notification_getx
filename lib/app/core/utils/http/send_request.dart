import 'package:http/http.dart';
import 'dart:convert';
import 'http_method.dart';

///Función privada para la codificación del cuerpo de la petición
dynamic _parsebody(dynamic body) {
  try {
    return jsonEncode(body);
  } catch (e) {
    return body;
  }
}

///Función que envía la petición al API, retorna una respuesta http
///```
///Future<Response> sendRequest({
///   required Uri url, //URL del API
///   required HttpMethod method, //Tipo de método
///   required Map<String, String> headers, //Mapa de los cabezales de la petición
///   required dynamic body, //Cuerpo de la petición
///   required Duration timeOut, //Tiempo máximo de espera
/// })
///```
Future<Response> sendRequest({
  required Uri url,
  required HttpMethod method,
  required Map<String, String> headers,
  required dynamic body,
  required Duration timeOut,
}) {
  ///Los headers originales se pueden modificar en el transcurso de su uso,
  ///por eso se hizo este mapa modificable [finalHeaders], el cual contiene los
  ///[headers] originales y los que se agregarán
  Map<String, String> finalHeaders = {...headers};
  //Si el método empleado es diferente a GET, verificarlo
  if (method != HttpMethod.get) {
    final contentType = headers['Content-Type'];
    if (contentType == null || contentType.contains('application/json')) {
      finalHeaders['Content-Type'] = 'application/json; charset=UTF-8';
      body = _parsebody(body);
    }
  }
  //Instancia de client, para darle tiempo a las peticiones
  final client = Client();
  switch (method) {
    case HttpMethod.get: //**Método GET */
      return client
          .get(
            url,
            headers: finalHeaders,
          )
          .timeout(timeOut);
    case HttpMethod.post: //**Método POST */
      return client
          .post(
            url,
            headers: finalHeaders,
            body: body,
          )
          .timeout(timeOut);
    case HttpMethod.put: //**Método PUT */
      return client
          .put(
            url,
            headers: finalHeaders,
            body: body,
          )
          .timeout(timeOut);
    case HttpMethod.patch: //**Método PATCH */
      return client
          .patch(
            url,
            headers: finalHeaders,
            body: body,
          )
          .timeout(timeOut);
    case HttpMethod.delete: //**Método DELETE */
      return client
          .delete(
            url,
            headers: finalHeaders,
            body: body,
          )
          .timeout(timeOut);
  }
}
