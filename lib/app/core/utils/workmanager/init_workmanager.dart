import 'package:workmanager/workmanager.dart';

import 'callback_dispatcher.dart';

Future<void> initWorkmanager() async {
  await Workmanager().initialize(
    callbackDispatcher,
    // isInDebugMode: true,
  );
}
