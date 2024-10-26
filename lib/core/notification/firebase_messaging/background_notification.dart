import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../notification_implementation.dart';

@pragma('vm:entry-point')
Future<void> backgroundHandler(RemoteMessage message) async {
  // Handle the background message here
  debugPrint('Handling a background message: ${message.messageId}');
  showNotification(message.data, null);
  // You can perform actions based on the message, such as updating local data or showing a notification
}

class BackGroundNotification {
  /// Initializes background notification handling.
  void backgroundInitializer() {
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  }
}
