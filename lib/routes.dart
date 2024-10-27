// routes.dart

import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/dashboard.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/login': (context) => const LoginPage(),
    '/dashboard': (context) => const DashboardPage(),
  };
}
