import 'dart:developer';

import 'package:workmanager/workmanager.dart';

import 'callbacks/get_notifications.dart';

void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    final String token = inputData!["token"];
    switch (taskName) {
      case 'periodicGetNotifications':
        log('Token: $token');
        final send = await sendRequestNotifications(token);
        if (send == null) {
          return Future.error('Error getting Notifications');
        }
        return Future.value(send);
    }
    return Future.error('Unknown Callback');
  });
}
