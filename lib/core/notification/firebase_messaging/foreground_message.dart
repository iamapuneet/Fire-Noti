import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

/// A class to manage foreground notification settings for Firebase Messaging.
class ForegroundMessage {
  final FirebaseMessaging firebaseMessaging;

  /// Constructor to initialize [ForegroundMessage] with an instance of [FirebaseMessaging].
  ForegroundMessage(this.firebaseMessaging);

  /// Configures foreground notification presentation options.
  ///
  /// This method sets the options for displaying notifications when the app is in the foreground.
  Future<void> setForegroundNotificationOptions() async {
    try {
      await firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true,  // Show alert notifications
        badge: true,  // Update the app badge
        sound: true,  // Play sound for notifications
      );
      debugPrint('Foreground notification presentation options set successfully.');
    } catch (error) {
      debugPrint('Error setting foreground notification options: $error');
    }
  }
}
