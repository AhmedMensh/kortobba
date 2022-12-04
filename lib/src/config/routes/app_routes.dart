import 'package:flutter/material.dart';
import 'package:kortoba_flutter_task/src/presentation/screens/login/login_screen.dart';
import 'package:kortoba_flutter_task/src/presentation/screens/main/main_screen.dart';
import 'package:kortoba_flutter_task/src/presentation/screens/splash/splash_screen.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return _materialRoute(const SplashScreen());
      case LoginScreen.routeName:
        return _materialRoute(const LoginScreen());

      case MainScreen.routeName:
        return _materialRoute(const MainScreen());

      default:
        return _materialRoute(const SplashScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
