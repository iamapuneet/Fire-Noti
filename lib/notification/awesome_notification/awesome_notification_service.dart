import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:noti/presentation/main_screen.dart';
import '../../../main.dart';
import '../../core/router/app_router.dart';
import '../model/button_model.dart';

// Private constants and fields
const String _buttonKey1 = 'newPage';
const String _buttonKey2 = 'reply';
const String _buttonKey3 = 'toast';

/// Handles actions when a notification button is pressed.
@pragma('vm:entry-point')
Future<void> _onActionReceivedMethod(ReceivedAction event) async {
  BuildContext? context = MyApp.navigatorObserver.navigator?.context;
  if (event.buttonKeyPressed == _buttonKey1) {
    _navigateToNewRequestScreen();
  } else if (event.buttonKeyPressed == _buttonKey2 && context != null) {
    showMessage(
        msg: '''Your Reply is :- ${event.buttonKeyInput} ''', context: context);
  } else if (context != null && event.buttonKeyPressed == _buttonKey3) {
    showMessage(
        msg:
            '''Why do programmers prefer dark mode?\nBecause light attracts bugs! 🐛💻 ''',
        context: context);
  }
}

/// Service for handling notifications using Awesome Notifications package.
class AwesomeNotificationService {
  final List<ButtonModel>? buttonList;
  AwesomeNotificationService({this.buttonList});

  /// Creates a notification with optional action buttons and a big picture.
  ///
  /// [id] - The ID for the notification (default is an empty string).
  /// [uid] - The unique ID of the notification.
  /// [title] - The title of the notification.
  /// [body] - The body content of the notification.
  /// [bigPicture] - The URL or asset path of the big picture (optional).
  /// [timeoutAfter] - Duration after which the notification should be dismissed (optional).
  /// [payload] - Custom payload data (optional).
  /// [buttonList] - List of action buttons for the notification (optional).
  /// [wakeUpScreen] - If true, wakes up the screen when the notification is received.
  /// [notificationLayout] - The layout of the notification.
  /// [channelKey] - The channel key for categorizing the notification.
  Future<void> createNotification({
    String? id,
    int? uid,
    String? title,
    bool locked = false,
    String? body,
    String? bigPicture,
    String? customSound,
    String? largeIcon,
    bool repeats = false,
    DateTime? scheduledTime,
    bool preciseAlarm = false,
    Duration? timeoutAfter,
    Map<String, String?>? payload,
    bool wakeUpScreen = false,
    bool allowWhileIdle = false,
    NotificationLayout notificationLayout = NotificationLayout.Default,
    required String channelKey,
  }) async {
    NotificationSchedule? schedule;
    if (scheduledTime != null) {
      String localTimeZone =
          await AwesomeNotifications().getLocalTimeZoneIdentifier();

      // Create the notification calendar instance
      schedule = NotificationCalendar(
        timeZone: localTimeZone,
        year: scheduledTime.year,
        month: scheduledTime.month,
        day: scheduledTime.day,
        hour: scheduledTime.hour,
        minute: scheduledTime.minute,
        second: scheduledTime.second,
        millisecond: scheduledTime.millisecond,
        allowWhileIdle: allowWhileIdle,
        repeats: repeats,
        preciseAlarm: preciseAlarm,
      );
    }
    // Start listening for notification events
    _startListeningNotificationEvents();

    // Build action buttons from the buttonList
    List<NotificationActionButton>? actionButtons =
        _buildActionButtons(buttonList: buttonList);

    // Create the notification
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: uid ?? 0,
        channelKey: channelKey,
        title: title,
        body: body,
        wakeUpScreen: wakeUpScreen,
        bigPicture: bigPicture,
        largeIcon: largeIcon,
        payload: payload,
        locked: locked,
        timeoutAfter: timeoutAfter,
        customSound: customSound,
        notificationLayout: bigPicture != null
            ? NotificationLayout.BigPicture
            : notificationLayout,
      ),
      schedule: schedule,
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

  /// Starts listening for notification action events.
  Future<void> _startListeningNotificationEvents() {
    return AwesomeNotifications().setListeners(
      onActionReceivedMethod: _onActionReceivedMethod,
    );
  }

  /// Builds action buttons for notifications if required.
  ///
  /// [buttonModel] - A list of ButtonModel instances to create the action buttons.
  List<NotificationActionButton>? _buildActionButtons(
      {List<ButtonModel>? buttonList}) {
    if (buttonList?.isNotEmpty == true) {
      return buttonList?.map((element) {
        return NotificationActionButton(
          key: element.key,
          label: element.label,
          color: element.color,
          icon: element.icon,
          actionType: element.actionType,
          autoDismissible: element.autoDismissible,
          enabled: element.enabled,
          requireInputText: element.requireInputText,
          showInCompactView: element.showInCompactView,
          isDangerousOption: element.isDangerousOption,
        );
      }).toList();
    }

    return null;
  }

  NotificationActionButton createButton({
    required ButtonType buttonType,
    required String buttonKey,
    required String label,
    Color? color,
    String? icon,
    bool autoDismissible = true,
    bool enabled = true,
  }) {
    return NotificationActionButton(
      key: buttonKey,
      label: label,
      color: color,
      icon: icon,
      actionType: buttonType == ButtonType.custom
          ? ActionType.KeepOnTop
          : ActionType.Default,
      autoDismissible: autoDismissible,
      enabled: enabled,
      requireInputText: buttonType == ButtonType.message,
      showInCompactView: buttonType != ButtonType.custom,
      isDangerousOption: buttonType == ButtonType.custom,
    );
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
