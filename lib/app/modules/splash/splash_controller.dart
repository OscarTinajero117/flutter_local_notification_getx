import 'dart:developer';

import 'package:get/get.dart';

import '../../core/utils/notifications/local_notifications.dart';
import '../../core/utils/workmanager/before_to/get_notifications.dart';
import '../../routers/app_routes.dart';

class SplashController extends GetxController {
  late final LocalNotifications notify;

  void _listenToNotification() =>
      notify.onNotificationClick.stream.listen(_onNotificactionListener);

  void _onNotificactionListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      log('payload $payload');
      Get.toNamed(Routes.HOME, arguments: payload);
    }
  }

  Future<void> notificationFromAPI() async =>
      await beforeToPeriodicTaskSendNotifications(token: 'PutYourToken');

  @override
  void onInit() async {
    notify = LocalNotifications();
    notify.initialize();
    _listenToNotification();
    super.onInit();
  }
}
