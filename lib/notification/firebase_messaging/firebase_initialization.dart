import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class FirebaseInitialization {
  final Function(Map<String, dynamic> data, BuildContext? context)
      showNotification;
  final BuildContext context;

  FirebaseInitialization(
      {required this.showNotification, required this.context});

  /// Initializes Firebase Messaging and listens for foreground messages.
  Future<void> firebaseInit() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage payloads) async {
      // Extract data from the payload
      Map<String, dynamic> data = payloads.data;

      if (data.isNotEmpty) {
        // Show notification based on the platform
        if ((Platform.isAndroid || Platform.isIOS) && context.mounted) {
          showNotification.call(data, context);
        }
      } else {
        if (kDebugMode) {
          debugPrint('Received empty payload data');
        }
      }
    });
  }
}
