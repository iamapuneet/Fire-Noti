import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';

/// A class to manage device tokens for Firebase Cloud Messaging (FCM).
///
/// This class helps you get, refresh, and delete the device token used for notifications.
class NotificationDeviceToken {
  final FirebaseMessaging _firebaseMessaging;

  /// Constructor to initialize [NotificationDeviceToken].
  NotificationDeviceToken(this._firebaseMessaging);

  /// Gets the device token for sending notifications.
  ///
  /// This method retrieves the current device token. You can use this token to send notifications
  /// to this device.
  ///
  /// Returns:
  /// - A `Future<String>` that provides the device token. If the token cannot be found,
  ///   it returns an empty string.
  Future<String?> getDeviceToken() async {
    String? deviceToken = await _firebaseMessaging.getToken();
    debugPrint('Device Token: $deviceToken');
    return deviceToken;
  }

  /// Listens for changes to the device token.
  ///
  /// This method sets up a listener that triggers whenever the token is updated.
  /// It's important to listen for updates because the token may change.
  void listenForTokenRefresh() {
    _firebaseMessaging.getNotificationSettings();
    _firebaseMessaging.onTokenRefresh.listen((String deviceToken) {
      debugPrint('Updated Device Token: $deviceToken');
    });
  }

  /// Deletes the current device token.
  ///
  /// Use this method to remove the device token when you no longer want to receive notifications.
  Future<void> deleteDeviceToken() async {
    try {
      await _firebaseMessaging.deleteToken();
      debugPrint("Device token deleted successfully!");
    } catch (error) {
      debugPrint("Failed to delete device token: $error");
    }
  }
}
