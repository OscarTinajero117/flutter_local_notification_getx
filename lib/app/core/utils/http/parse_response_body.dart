import 'dart:convert';

///Función para parsear el cuerpo de una respuesta, trata de decodificarlo,
///si no lo logra, lo retorna al cuál fue recibido.
dynamic parseResponseBody(String responseBody) {
  try {
    return jsonDecode(responseBody);
  } catch (e) {
    return responseBody;
  }
}
