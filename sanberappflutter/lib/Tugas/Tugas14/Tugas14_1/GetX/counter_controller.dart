import 'package:get/get.dart';

class CounterController2 extends GetxController {
  var counter = 0.obs;
  void increment() => counter++;
}
