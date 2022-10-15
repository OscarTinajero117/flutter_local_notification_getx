import 'dart:async';
import 'dart:io';

import '../../../data/models/notifications.dart';
import '../http/http.dart';
import '../http/http_method.dart';
import 'response.dart';
import 'return_api.dart';

class API {
  final Http _http;

  API(this._http);

  Future<ReturnAPI<List<Notification>>> getNotifications(
    String token,
  ) async {
    final result = await _http.request(
      'PutYourPath',
      method: HttpMethod.get,
      headers: {
        "token": token,
      },
    );
    if (result.error == null) {
      //Se atrapa la respuesta de los datos
      final List data = result.data["data"];
      final List<Notification> list =
          (data).map((e) => Notification.fromJson(e)).toList();

      return ReturnAPI(response: ResponseAPI.ok, toReturn: list);
    }
    if (result.statusCode == 401) {
      return ReturnAPI(response: ResponseAPI.accessDenied);
    }
    final error = result.error!.exception;
    if (error is SocketException || error is TimeoutException) {
      return ReturnAPI(response: ResponseAPI.networkError);
    }
    return ReturnAPI(response: ResponseAPI.unknownError);
  }
}
