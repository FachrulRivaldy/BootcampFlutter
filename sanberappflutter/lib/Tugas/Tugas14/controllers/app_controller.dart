// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:sanberappflutter/Tugas/Tugas14/models/post_model.dart';
import 'package:sanberappflutter/Tugas/Tugas14/services/services.dart';

class AppController extends GetxController {
  var getposts = <PostModel>[].obs;
  Services services = Services();
  var postloading = true.obs;
  @override
  void onInit() {
    callpostmethod();
    super.onInit();
  }

  callpostmethod() async {
    try {
      postloading.value = true;
      var result = await services.getallposts();
      if (result != null) {
        getposts.assignAll(result);
      } else {
        print("null");
      }
    } finally {
      postloading.value = false;
    }
    update();
  }
}
