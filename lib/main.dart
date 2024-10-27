import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/router/app_router.dart';
// 🚨 Removed the import for security
import 'firebase_options.dart';
import 'notification/awesome_notification/notification_channel_service.dart';
import 'notification/notification_implementation.dart';

// 🔒 We have removed the firebase_options.dart file for security purposes.
// 📥 Please remember to add the google-services.json file.
// ✅ You can use the Firebase CLI, and it will work properly.
FirebaseOptions options = DefaultFirebaseOptions.currentPlatform;



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: options);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static NavigatorObserver navigatorObserver = NavigatorObserver();
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    fireNoti();
    super.initState();
  }
  fireNoti() async {
    String icon = 'resource://mipmap/ic_stat';
    String sound = 'resource://raw/noti_sound';
    final notification = NotificationImplementation(
      awesomeChannelService: AwesomeChannelService(
        notificationIcon: icon,
        sound: sound,
      ),

    );
    notification.initialize();
    await notification.fcmInitialize(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FireNoti',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorObservers: [MyApp.navigatorObserver],
      initialRoute: AppRouter.splash,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
