import 'package:flutter/material.dart';
import '../home_screen.dart';
import '../login_screen.dart';

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const HomeScreen(),
    '/login': (context) => const LoginScreen()
  };
}
