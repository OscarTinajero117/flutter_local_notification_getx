import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/utils/workmanager/init_workmanager.dart';
import 'app/modules/splash/splash_binding.dart';
import 'app/modules/splash/splash_page.dart';
import 'app/routers/app_pages.dart';
import 'app/routers/app_routes.dart';

void main() async {
  ///Workmanager use
  WidgetsFlutterBinding.ensureInitialized();

  ///init background task (workmanager)
  await initWorkmanager();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.SPLASH,
    theme: ThemeData.light(),
    defaultTransition: Transition.fade,
    initialBinding: SplashBinding(),
    getPages: AppPages.pages,
    home: const SplashPage(),
  ));
}
