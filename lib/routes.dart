// routes.dart

import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/dashboard.dart';
import 'loading_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/loading': (context) => LoadingScreen(),
    '/login': (context) => const LoginPage(),
    '/dashboard': (context) => const DashboardPage(),
  };
}
