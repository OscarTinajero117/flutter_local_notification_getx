import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/rounded_button.dart';
import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SELECT NOTIFICATION'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is a demo of how to use local notifications in Flutter with GetX.',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            RoundedButton(
              onPressed: () async {
                await controller.notify.showNotification(
                  id: 0,
                  title: 'Simple Notification',
                  body: 'Some body',
                );
              },
              text: 'Show Local Notification',
            ),
            RoundedButton(
              onPressed: () async {
                await controller.notify.showScheduledNotification(
                  id: 1,
                  title: 'Scheduled Notification',
                  body: 'Some body',
                  seconds: 3,
                );
              },
              text: 'Show Scheduled Notification',
            ),
            RoundedButton(
              onPressed: () async {
                await controller.notify.showNotificationWithPayload(
                  id: 2,
                  title: 'Notification With Payload',
                  body: 'Some body',
                  payload: 'Home Page',
                );
              },
              text: 'Show Notification With Payload',
            ),
            RoundedButton(
              onPressed: () async {
                await controller.notificationFromAPI();
              },
              text: 'Show Notification From API',
            ),
          ],
        ),
      ),
    );
  }
}
