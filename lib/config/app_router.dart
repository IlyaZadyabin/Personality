import 'package:flutter/material.dart';
import 'package:personality/features/home/screens/home_screen.dart';
import 'package:personality/features/test/screens/result_screen.dart';
import 'package:personality/features/test/screens/test_screen.dart';

abstract class Routes {
  static const String home = '/';
  static const String test = 'test';
  static const String result = 'result';
}

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.test:
        return MaterialPageRoute(builder: (_) => const TestScreen());

      case Routes.result:
        return MaterialPageRoute(builder: (_) => const ResultScreen());

      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
