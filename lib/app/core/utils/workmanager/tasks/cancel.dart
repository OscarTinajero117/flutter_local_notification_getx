//cancelAll
import 'package:workmanager/workmanager.dart';

Future<void> cancelAllTask() async => await Workmanager().cancelAll();
