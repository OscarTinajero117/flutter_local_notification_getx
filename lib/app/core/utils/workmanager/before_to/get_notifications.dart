import '../tasks/get_notifications.dart';

// final token = await getParam(TOKEN_APP);
Future<void> beforeToPeriodicTaskSendNotifications({
  required String token,
}) async =>
    await periodicTaskNotifications({'token': token});
