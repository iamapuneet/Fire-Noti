import 'package:flutter/material.dart';
import '../../presentation/main_screen.dart';
import '../../presentation/new_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String newScreen = '${splash}new_screen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case newScreen:
        final args = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (_) => NewScreen(
            first: args['first'].toString(),
            second: args['second'].toString(),
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('ERROR: Route not found')),
      ),
    );
  }
}
