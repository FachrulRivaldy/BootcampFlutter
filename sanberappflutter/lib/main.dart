// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:sanberappflutter/Tugas/Tugas14/Tugas14_1/GetX/counter_screen.dart';
import 'package:sanberappflutter/Tugas/Tugas14/Tugas14_1/Obx/home.dart';
import 'package:sanberappflutter/Tugas/Tugas14/get_data_screen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:sanberappflutter/Tugas/Tugas15/pages/page_1.dart';
import 'package:sanberappflutter/Tugas/Tugas15/routes/page_routes.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SanberApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5E73E1)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const PageOne(),
      getPages: pageRouteApp.pages,
    );
  }
}
