import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanberappflutter/Tugas/Tugas15/routes/route_name.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Halaman Dua"),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteName.page_1);
              },
              child: const Text("Menuju Halaman Satu"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteName.page_3);
              },
              child: const Text("Menuju Halaman Tiga"),
            ),
          ],
        ),
      ),
    );
  }
}
