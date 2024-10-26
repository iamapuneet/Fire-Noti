import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../router/app_router.dart';

// Private constants and fields
const String _buttonKey = 'viewOrderButton';

/// Handles actions when a notification button is pressed.
@pragma('vm:entry-point')
Future<void> _onActionReceivedMethod(ReceivedAction event) async {
  if (event.buttonKeyPressed == _buttonKey) {
    _navigateToNewRequestScreen();
  }
}

/// Service for handling notifications using Awesome Notifications package.
class AwesomeNotificationService {
  /// Creates a notification with optional action buttons and a big picture.
  ///
  /// [id] - The ID for the notification (default is an empty string).
  /// [uid] - The unique ID of the notification.
  /// [title] - The title of the notification.
  /// [body] - The body content of the notification.
  /// [bigPicture] - The URL or asset path of the big picture (optional).
  /// [showButton] - If true, shows an action button in the notification.
  /// [channelKey] - The channel key for categorizing the notification.
  Future<void> createNotification({
    String? id,
    int? uid,
    String? title,
    String? body,
    String? bigPicture,
    bool showButton = false,
    bool wakeUpScreen = false,
    required String channelKey,
  }) async {
    _startListeningNotificationEvents();
    List<NotificationActionButton>? actionButtons =
        _buildActionButtons(showButton);
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: uid ?? 0,
        channelKey: channelKey,
        title: title,
        body: body,
        wakeUpScreen: wakeUpScreen,
        bigPicture: bigPicture,
        notificationLayout: bigPicture != null
            ? NotificationLayout.BigPicture
            : NotificationLayout.Default,
      ),
      actionButtons: actionButtons,
    );
  }

  /// Creates a basic notification without action buttons.
  ///
  /// [uid] - The unique ID of the notification.
  /// [title] - The title of the notification.
  /// [body] - The body content of the notification.
  /// [channelKey] - The channel key for categorizing the notification.
  Future<void> createNormalNotification({
    int? uid,
    String? title,
    String? body,
    required String channelKey,
  }) async {
    _startListeningNotificationEvents();
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: uid ?? 0,
        channelKey: channelKey,
        title: title,
        body: body,
      ),
    );
  }

  /// Schedules a notification to be triggered at a specified time.
  ///
  /// [uid] - The unique ID of the notification.
  /// [title] - The title of the notification.
  /// [body] - The body content of the notification.
  /// [channelKey] - The channel key for categorizing the notification.
  /// [scheduleTime] - The time when the notification should be shown.
  Future<void> createScheduledNotification({
    int? uid,
    String? title,
    String? body,
    required String channelKey,
    required DateTime scheduleTime,
  }) async {
    _startListeningNotificationEvents();
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: uid ?? 0,
        channelKey: channelKey,
        title: title,
        body: body,
      ),
      schedule: NotificationCalendar.fromDate(date: scheduleTime),
    );
  }

  /// Updates the content of an existing notification.
  ///
  /// [notificationId] - The ID of the notification to be updated.
  /// [title] - The new title of the notification.
  /// [body] - The new body content of the notification.
  /// [bigPicture] - The new big picture URL or asset path (optional).
  /// [channelKey] - The channel key for categorizing the notification.
  Future<void> updateNotification({
    required int notificationId,
    String? title,
    String? body,
    String? bigPicture,
    required String channelKey,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: notificationId,
        channelKey: channelKey,
        title: title,
        body: body,
        bigPicture: bigPicture,
        notificationLayout: bigPicture != null
            ? NotificationLayout.BigPicture
            : NotificationLayout.Default,
      ),
    );
  }

  /// Cancels a notification by its ID.
  ///
  /// [notificationId] - The ID of the notification to cancel.
  Future<void> cancelNotification(int notificationId) async {
    await AwesomeNotifications().cancel(notificationId);
  }

  /// Cancels all notifications.
  Future<void> cancelAllNotifications() async {
    return await AwesomeNotifications().cancelAll();
  }

  /// Resets the global notification badge count.
  Future<void> resetBadge() async {
    await AwesomeNotifications().resetGlobalBadge();
  }

  /// Checks if notifications are allowed and requests permission if not.
  Future<void> checkNotificationPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await requestNotificationPermission();
    }
  }

  /// Requests notification permission from the user.
  Future<void> requestNotificationPermission() async {
    await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  // Private helper methods

  /// Starts listening for notification action events.
  Future<void> _startListeningNotificationEvents() {
    return AwesomeNotifications().setListeners(
      onActionReceivedMethod: _onActionReceivedMethod,
    );
  }

  /// Builds action buttons for notifications if required.
  ///
  /// [showButton] - If true, includes an action button.
  List<NotificationActionButton>? _buildActionButtons(bool showButton) {
    if (showButton) {
      return [
        NotificationActionButton(
          key: _buttonKey,
          label: 'View Screen',
          color: Colors.amber,
        ),
      ];
    }
    return null;
  }
}

void _navigateToNewRequestScreen() {
  BuildContext? context = MyApp.navigatorObserver.navigator?.context;
  if (context != null) {
    Navigator.pushNamed(context, AppRouter.newScreen, arguments: {
      'first': 'Welcome! 🎉',
      'second':
          'We\'re so glad you\'re here! 🌟 Enjoy exploring and feel free to reach out if you need any assistance. 😊 Happy to have you with us!'
    });
  }
}
