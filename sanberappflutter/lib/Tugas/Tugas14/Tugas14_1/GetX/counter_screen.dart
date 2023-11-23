import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanberappflutter/Tugas/Tugas14/Tugas14_1/GetX/counter_controller.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reactive GetX"),
      ),
      body: Center(
        child: GetX<CounterController2>(
          init: CounterController2(),
          builder: (controller) =>
              Text("Counter Getx : ${controller.counter.value}"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<CounterController2>().increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
