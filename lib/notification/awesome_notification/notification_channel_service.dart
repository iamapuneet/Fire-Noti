import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A service class to manage the initialization of notification channels
/// using the Awesome Notifications package.
class AwesomeChannelService {
  // Notification sound source path
  final String? sound;

  // Default icon for the notifications
  final String? notificationIcon;

  /// Constructor for initializing [AwesomeChannelService].
  ///
  /// [sound] represents the sound source for notifications.
  /// [notificationIcon] represents the icon path used for the notifications.
  AwesomeChannelService({
    this.sound,
    this.notificationIcon,
  });

  /// Initializes notification channels.
  ///
  /// This method allows users to configure multiple notification channels.
  Future<void> initializeChannels({
    required List<NotificationChannel> channels,
    String? languageCode,
    List<NotificationChannelGroup>? channelGroups,
  }) async {
    await AwesomeNotifications().initialize(
      notificationIcon, // App icon (null will use the default icon)
      channels,
      languageCode: languageCode,
      debug: kDebugMode,
      channelGroups: channelGroups,
    );
  }

  /// Creates and returns a generic notification channel configuration.
  ///
  /// This helper method is used to create a channel with standard settings.
  NotificationChannel createChannel({
    required String channelKey,
    required String channelName,
    required String channelDescription,
    NotificationImportance importance = NotificationImportance.Max,
    String? soundSource,
    String? groupKey,
    Color? ledColor,
    Color? defaultColor,
    DefaultRingtoneType? defaultRingtoneType,
    bool criticalAlerts = false,
    bool channelShowBadge = true,
    bool locked = false,
    bool onlyAlertOnce = true,
  }) {
    return NotificationChannel(
      channelKey: channelKey,
      channelName: channelName,
      channelDescription: channelDescription,
      importance: importance,
      soundSource: soundSource,
      ledColor: ledColor ?? Colors.brown,
      defaultColor: defaultColor ?? Colors.brown,
      criticalAlerts: criticalAlerts,
      channelShowBadge: channelShowBadge,
      icon: notificationIcon,
      locked: locked,
      onlyAlertOnce: onlyAlertOnce,
      groupKey: groupKey,
      defaultRingtoneType: defaultRingtoneType,
    );
  }

  /// Creates and returns a generic notification channel group configuration.
  ///
  /// This helper method is used to create a channel with standard settings.
  NotificationChannelGroup notificationChannelGroup({
    required String channelGroupKey,
    required String channelGroupName,
  }) {
    return NotificationChannelGroup(
      channelGroupKey: channelGroupKey,
      channelGroupName: channelGroupName,
    );
  }
}
