// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:sanberappflutter/Tugas/Tugas12/get_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SanberApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5E73E1)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const GetDataScreen(),
    );
  }
}
