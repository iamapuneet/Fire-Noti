import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:noti/notification/uuid.dart';
import '../core/router/app_router.dart';
import 'awesome_notification/awesome_notification_service.dart';
import 'firebase_messaging/firebase_initialization.dart';
import 'firebase_messaging/foreground_message.dart';
import 'firebase_messaging/setup_interact_message.dart';
import 'awesome_notification/notification_channel_service.dart';
import 'firebase_messaging/background_notification.dart';
import 'firebase_messaging/notification_device_token.dart';
import 'firebase_messaging/notification_permissions.dart';

/// A class to implement notification functionalities.
class NotificationImplementation {
  final AwesomeChannelService awesomeChannelService;

  // Define channel keys
  final String _warningKey = 'warning';
  final String _channelKey1 = 'normal';

  /// Constructor to initialize [NotificationImplementation].
  NotificationImplementation({
    required this.awesomeChannelService,
  });

  /// Initializes Awesome Notifications and creates notification channels.
  Future<void> initialize() async {
    // Initialize Awesome Notifications
    await awesomeChannelService.initializeChannels(
        channels: _createNotificationChannels(),
        channelGroups: _createNotificationGroups());
  }

  /// Creates notification channels for the application.
  List<NotificationChannel> _createNotificationChannels() {
    return [
      awesomeChannelService.createChannel(
        soundSource: awesomeChannelService.sound,
        criticalAlerts: true,
        channelKey: _warningKey,
        channelName: "Warning Notifications",
        channelDescription: "Notification for new orders.",
        ledColor: Colors.green,
        defaultColor: Colors.red,
        importance: NotificationImportance.Max,
        channelShowBadge: true,
        locked: true,
        defaultRingtoneType: DefaultRingtoneType.Notification,
        onlyAlertOnce: true,
        groupKey: 'warning_group',
      ),
      awesomeChannelService.createChannel(
        criticalAlerts: true,
        channelKey: _channelKey1,
        channelName: "Normal Notifications",
        channelDescription: "Notifications for normal alerts.",
        ledColor: Colors.green,
        defaultColor: Colors.green,
        importance: NotificationImportance.Max,
        channelShowBadge: true,
        groupKey: 'normal_group',
      ),
    ];
  }

  /// Creates notification channel groups for the application.
  List<NotificationChannelGroup> _createNotificationGroups() {
    return [
      awesomeChannelService.notificationChannelGroup(
        channelGroupName: _warningKey,
        channelGroupKey: _warningKey,
      ),
    ];
  }

  Future<void> fcmInitialize(BuildContext context) async {
    BackGroundNotification().backgroundInitializer();
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    ForegroundMessage(firebaseMessaging).setForegroundNotificationOptions();
    NotificationPermissions(firebaseMessaging).requestNotificationPermission();
    NotificationDeviceToken(firebaseMessaging);
    FirebaseInitialization(
        showNotification: showNotification, context: context);
    SetupInteractMessage(firebaseMessaging: firebaseMessaging, context: context)
        .setupInteractMessage();
  }
}

showNotification(Map<String, dynamic> data, BuildContext? context) {
  if (data['page'] == 'newRequestScreen' &&
      data['android_channel_id'] == 'warning') {
    String channelKey = 'warning';
    AwesomeNotificationService().createNotification(
        title: data['title'],
        body: data['body'],
        channelKey: channelKey,
        id: data['id'] ?? '',
        uid: int.parse(data['id'] ?? '2'));
    if (context != null) {
      Navigator.pushNamed(context, AppRouter.newScreen,
          arguments: {'first': 5, 'second': 10});
    }
  }
  if (data['android_channel_id'] == 'normal') {
    String channelKey = 'normal';
    AwesomeNotificationService().createNotification(
        title: data['title'],
        body: data['body'],
        channelKey: channelKey,
        uid: generateSSID());
  }
}
