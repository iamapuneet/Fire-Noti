import 'package:firebase_messaging/firebase_messaging.dart';

import '../notification/firebase_messaging/notification_permissions.dart';

void requestNotificationPermission({
  required Function(String) onSuccess,
  required Function(String) onFailure,
}) async {
  try {
    // Create an instance of NotificationPermissions
    NotificationPermissions notificationPermissions =
        NotificationPermissions(FirebaseMessaging.instance);

    // Request notification permission
    bool status = await notificationPermissions.requestNotificationPermission();

    if (status) {
      // If permission is granted, call onSuccess callback
      onSuccess('✅ Notification permission granted');
    } else {
      // If permission is denied, call onFailure callback
      onFailure('❌ Notification permission denied');
    }
  } catch (e) {
    // Handle any exceptions that occur
    onFailure('🚨 An error occurred while requesting permission: $e');
  }
}
