import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:noti/core/widget/button.dart';

import '../core/notification/awesome_notification/awesome_notification_service.dart';
import '../core/permistion.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onTertiaryContainer;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Main Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: color,
        actions: [
          IconButton(
              onPressed: () {
                AwesomeNotificationService().cancelAllNotifications().then(
                  (value) {
                    if (context.mounted) {
                      showMessage(msg: Message.clearMessage, context: context);
                    }
                  },
                );
              },
              icon: const Icon(
                Icons.cleaning_services,
                color: Colors.white,
              )),
          box,
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Button(
            text: 'Simple Notification',
            onPressed: () {
              NotificationTest.simple(context);
            },
            borderColor: color,
            textColor: color,
          ),
          box,
          Button(
            text: 'Sound Notification',
            onPressed: () {
              NotificationTest.sound(context);
            },
            borderColor: color,
            textColor: color,
          ),
          box,
          Button(
            text: 'Big Image Notification',
            onPressed: () {
              NotificationTest.bigImage(context);
            },
            borderColor: color,
            textColor: color,
          ),
          box,
          Button(
            text: 'Button Notification',
            onPressed: () {
              NotificationTest.button(context);
            },
            borderColor: color,
            textColor: color,
          ),
          box,
          Button(
            text: 'Reply Message Notification',
            onPressed: () {
              NotificationTest.replyMessage(context);
            },
            borderColor: color,
            textColor: color,
          ),
          box,
          Button(
            text: 'Sadule Notification',
            onPressed: () {
              NotificationTest.replyMessage(context);
            },
            borderColor: color,
            textColor: color,
          ),
        ],
      ),
    );
  }
}

mixin NotificationTest {
  static simple(BuildContext context) {
    checker(
        context: context,
        onSuccess: () async {
          String channelKey = 'normal';
          await AwesomeNotificationService().createNormalNotification(
            channelKey: channelKey,
            uid: 1,
            title: NotificationMessages.title1,
            body: NotificationMessages.body1,
          );
        });
  }

  static sound(BuildContext context) {
    checker(
        context: context,
        onSuccess: () async {
          String channelKey = 'normal';
          await AwesomeNotificationService().createNotification(
            channelKey: channelKey,
            uid: 1,
            title: NotificationMessages.title1,
            body: NotificationMessages.body1,
            showButton: false,
          );
        });
  }

  static bigImage(BuildContext context) {
    checker(
        context: context,
        onSuccess: () async {
          String channelKey = 'normal';
          await AwesomeNotificationService().createNotification(
              channelKey: channelKey,
              uid: 1,
              title: NotificationMessages.title1,
              body: NotificationMessages.body1,
              showButton: false,
              bigPicture:
                  'https://static.toiimg.com/thumb/99972860/Taj-Mahal.jpg?width=300&height=200');
        });
  }

  static buttonNavigation(BuildContext context) {
    checker(
        context: context,
        onSuccess: () async {
          String channelKey = 'normal';
          await AwesomeNotificationService().createNotification(
            channelKey: channelKey,
            uid: 1,
            title: NotificationMessages.title1,
            body: NotificationMessages.body1,
            showButton: true,
          );
        });
  }

  static button(BuildContext context) {
    checker(
        context: context,
        onSuccess: () async {
          String channelKey = 'normal';
          await AwesomeNotificationService().createNotification(
            channelKey: channelKey,
            uid: 1,
            title: NotificationMessages.title1,
            body: NotificationMessages.body1,
            showButton: true,
          );
        });
  }

  static replyMessage(BuildContext context) {
    checker(
        context: context,
        onSuccess: () async {
          String channelKey = 'normal';
          await AwesomeNotificationService().createNotification(
            channelKey: channelKey,
            uid: 1,
            title: NotificationMessages.title1,
            body: NotificationMessages.body1,
            showButton: true,
          );
        });
  }
}

const box = SizedBox(
  height: 15,
  width: 10,
);

mixin NotificationMessages {
  static const title1 = '🎉 New Feature Alert!';
  static const body1 =
      '🚀 We’ve just launched a fantastic new feature! Check it out now and enhance your experience!';
}
mixin Message {
  static const clearMessage = 'Notification Cleared Successfully! ✅✨';
}

void checker({required BuildContext context, required Function onSuccess}) {
  requestNotificationPermission(
    onSuccess: (message) {
      onSuccess.call();
    },
    onFailure: (message) => showMessage(msg: message, context: context),
  );
}

void showMessage({required String msg, required BuildContext context}) {
  final color = Theme.of(context).colorScheme.onTertiaryContainer;
  final hide = ScaffoldMessenger.of(context).removeCurrentSnackBar();

  hide;
  final snack = SnackBar(
    content: Text(msg),
    backgroundColor: color,
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(
    snack,
  );
}
