import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/home_screen.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> pushReplacementToHomeScreen() async {
    await navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  Future<void> pushToHomeScreen() async {
    await navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  Future<void> pushNamedToHomeScreen() async {
    await navigatorKey.currentState?.pushReplacementNamed('/home');
    // or await navigatorKey.currentState?.pushNamed('/home');
  }

  Future<void> pop() async {
    navigatorKey.currentState?.pop();
  }
}
