import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import '../PayLoadModel/data.dart';
import '../go_specific_screen.dart';

class SetupInteractMessage {
  final FirebaseMessaging firebaseMessaging;
  final BuildContext context;

  SetupInteractMessage({required this.firebaseMessaging, required this.context});

  /// Sets up the interaction with incoming messages and handles navigation.
  void setupInteractMessage() async {
    // Check for any initial message that opened the app
    RemoteMessage? payloads = await firebaseMessaging.getInitialMessage();

    // If there is a payload, convert it to NavigationDetailsModel
    if (payloads != null) {
      _handlePayload(payloads);
    }

    // Listen for messages when the app is in the background
    FirebaseMessaging.onMessageOpenedApp.listen((payloads) {
      _handlePayload(payloads);
    });
  }

  /// Handles the incoming payload and navigates to the specified screen.
  void _handlePayload(RemoteMessage payloads) {
    try {
      final navigationDetailsModel = NavigationDetailsModel.fromJson(payloads.data);
      // Navigate to the specified screen using the NavigationService
      NavigationService(context: context).goToScreen(screen: navigationDetailsModel.screen ??'');
    } catch (error) {
      // Handle any parsing or navigation errors
      debugPrint('Error handling payload: $error');
    }
  }
}
