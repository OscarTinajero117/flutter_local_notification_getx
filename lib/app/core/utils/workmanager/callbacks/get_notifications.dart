import 'dart:developer';

import '../../../../data/models/notifications.dart';
import '../../../values/constants.dart';
import '../../api/api.dart';
import '../../api/response.dart';
import '../../notifications/local_notifications.dart';

/// Notifications
/// Send request to api
Future<bool?> sendRequestNotifications(String token) async {
  bool? response;
  try {
    response = await _periodicGetNotifications(token);
  } catch (e) {
    log('$e');
    response = null;
  }
  return response;
}

/// Get response from api
Future<bool> _periodicGetNotifications(String token) async {
  final api = API(API_URL);
  final result = await api.getNotifications(token);
  if (result.response == ResponseAPI.ok && result.toReturn != null) {
    final listNotifications = result.toReturn;

    /// Use Show Notifications
    if (listNotifications!.isNotEmpty) {
      final notify = LocalNotifications();
      notify.initialize();
      _listenToNotification(notify);
      for (Notification model in listNotifications) {
        //// log("${model.id}");
        //// log(model.title);
        //// log(model.message);
        await notify.showNotification(
          id: model.id,
          title: model.title,
          body: model.message,
        );
      }
    }
    return true;
  }
  return false;
}

void _listenToNotification(LocalNotifications notify) =>
    notify.onNotificationClick.stream.listen(_onNotificactionListener);

void _onNotificactionListener(String? payload) {
  if (payload != null && payload.isNotEmpty) {
    log('payload $payload');
  }
}
