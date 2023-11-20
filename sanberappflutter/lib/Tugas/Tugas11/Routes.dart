// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sanberappflutter/Tugas/Tugas11/LoginScreen.dart';
import 'package:sanberappflutter/Tugas/Tugas11/HomeScreen.dart';
import 'package:sanberappflutter/Tugas/Tugas11/MainScreen.dart';
import 'package:sanberappflutter/Tugas/Tugas11/ProfileScreen.dart';
import 'package:sanberappflutter/Tugas/Tugas11/SearchScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/main':
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/search':
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(child: Text('Error page')),
      );
    });
  }
}
