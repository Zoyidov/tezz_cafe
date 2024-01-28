import 'package:flutter/material.dart';
import 'package:tezz_cafe/presentation/screens/login_screen/login_screen.dart';
import 'package:tezz_cafe/presentation/tab_box/tab_box.dart';

class RouteNames {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';

}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (context) => const TabBox());
      case RouteNames.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouteNames.home:
        return MaterialPageRoute(builder: (context) => const TabBox());
    }
    return MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text("Route not found"))));
  }
}
