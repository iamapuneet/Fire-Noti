import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:noti/core/widget/button.dart';
import 'package:noti/notification/model/button_model.dart';
import '../core/permistion.dart';
import '../notification/awesome_notification/awesome_notification_service.dart';

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
            text: 'Schedule Notification',
            onPressed: () {
              NotificationTest.schedule(context);
            },
            borderColor: color,
            textColor: color,
          ),
          box,
          Button(
            text: 'Music Notification',
            onPressed: () {
              NotificationTest.music(context);
            },
            borderColor: color,
            textColor: color,
          ),
          box,
          Button(
            text: 'Big Text Notification',
            onPressed: () {
              NotificationTest.bigText(context);
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
          String channelKey = 'warning';
          await AwesomeNotificationService().createNotification(
            channelKey: channelKey,
            uid: 2,
            title: NotificationMessages.title2,
            body: NotificationMessages.body2,
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
              uid: 3,
              title: NotificationMessages.title3,
              body: NotificationMessages.body3,
              wakeUpScreen: true,
              bigPicture:
                  'https://i.pinimg.com/736x/f1/a4/dd/f1a4dd74eee61e4a3a8e2f588d519824.jpg',
              largeIcon:
                  'https://t3.ftcdn.net/jpg/06/71/36/46/360_F_671364623_ymuRMFC5XwW7rAbD8991O8uN30Inx3ZK.jpg');
        });
  }

  static button(BuildContext context) {
    checker(
        context: context,
        onSuccess: () async {
          String channelKey = 'normal';
          await AwesomeNotificationService(buttonList: [
            ButtonModel(key: 'toast', label: 'Toast', color: Colors.deepPurple),
            ButtonModel(
              key: 'newPage',
              label: 'New Page',
            ),
          ]).createNotification(
            channelKey: channelKey,
            uid: 4,
            title: NotificationMessages.title4,
            body: NotificationMessages.body4,
          );
        });
  }

  static replyMessage(BuildContext context) {
    checker(
        context: context,
        onSuccess: () async {
          String channelKey = 'normal';
          await AwesomeNotificationService(buttonList: [
            ButtonModel(
              key: 'reply',
              label: 'Reply Here....',
              color: Colors.deepOrange,
              requireInputText: true,
              autoDismissible: false,
              isDangerousOption: false,
            ),
          ]).createNotification(
            channelKey: channelKey,
            uid: 5,
            title: NotificationMessages.title5,
            body: NotificationMessages.body5,
            notificationLayout: NotificationLayout.Messaging,
          );
        });
  }

  static schedule(BuildContext context) {
    showMessage(
        msg:
            '⏳ Please hold on for a moment while we process your request! Thank you for your patience! 🙏',
        context: context);
    checker(
        context: context,
        onSuccess: () async {
          String channelKey = 'normal';
          await AwesomeNotificationService().createNotification(
            channelKey: channelKey,
            uid: 6,
            title: NotificationMessages.title6,
            locked: true,
            body: NotificationMessages.body6,
            scheduledTime: DateTime.now().add(const Duration(seconds: 4)),
          );
        });
  }

  static music(BuildContext context) {
    checker(
        context: context,
        onSuccess: () async {
          String channelKey = 'normal';

          await AwesomeNotificationService( ).createNotification(
            channelKey: channelKey,
            uid: 7,
            id: 'hello',
            title: NotificationMessages.title7,
            body: NotificationMessages.body7,
            customSound: 'resource://raw/noti_sound',
            locked: true,
            notificationLayout: NotificationLayout.MediaPlayer,

          );
        });
  }

  static bigText(BuildContext context) {
    checker(
        context: context,
        onSuccess: () async {
          String channelKey = 'normal';

          await AwesomeNotificationService().createNotification(
            channelKey: channelKey,
            uid: 7,
            id: 'hello',
            title: NotificationMessages.title8,
            body: NotificationMessages.body8,
            locked: true,
            notificationLayout: NotificationLayout.BigText,
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
  static const title2 = '🔔 Important Update!';
  static const body2 =
      '📢 A new sound notification has been added! Make sure your sound is on to catch all updates!';
  static const title3 = '🌟 Stunning Visual!';
  static const body3 =
      '📸 Don’t miss out! Check out this amazing new feature with an engaging image!';
  static const title4 = '🔗 Quick Actions!';
  static const body4 =
      '🛠️ Take action now! Choose one of the options below to proceed.';
  static const title5 = '💬 New Message Received!';
  static const body5 = '✉️ You have a new message. Tap to reply directly!';
  static const title6 = '⏰ Scheduled Reminder!';
  static const body6 =
      '📅 Don’t forget! This is a reminder for your upcoming task.';
  static const title7 = '🎶 Enjoy the Music!';
  static const body7 =
      '🎧 Tune in to our latest tracks and enjoy your listening experience!';
  static const title8 = '📰 Important Update!';
  static const body8 =
      '📢 We have an important announcement regarding our services. Please take a moment to read the details below:\n\n'
      '1. **Service Expansion**: We are excited to announce that our services are expanding to new regions!\n'
      '2. **New Features**: Get ready for exciting new features that will enhance your experience.\n'
      '3. **Feedback Request**: We value your feedback! Please let us know how we can improve.\n\n'
      'Stay tuned for more updates and thank you for being a valued member of our community!';
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
