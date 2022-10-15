import 'package:workmanager/workmanager.dart';

import '../tasks_names.dart';

Future<void> periodicTaskNotifications(Map<String, dynamic>? inputData) async {
  await Workmanager().registerPeriodicTask(
    TaskName.periodicGetNotifications.name,
    TaskName.periodicGetNotifications.name,
    inputData: inputData,
    // frequency: const Duration(minutes: 15),
    constraints: Constraints(
      networkType: NetworkType.connected,
      // requiresBatteryNotLow: true,
    ),
  );
}
