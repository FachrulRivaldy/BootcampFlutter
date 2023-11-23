import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanberappflutter/Tugas/Tugas14/Tugas14_1/Obx/controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController c = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting Screen"),
      ),
      body: Center(
        child: Text("Penerima State : ${c.count}"),
      ),
    );
  }
}
