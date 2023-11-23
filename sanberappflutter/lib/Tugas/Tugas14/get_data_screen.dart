import 'package:flutter/material.dart';
import 'controllers/app_controller.dart';
import 'package:get/get.dart';

class GetDataScreenManagement extends StatelessWidget {
  const GetDataScreenManagement({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Management GetX"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return controller.postloading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: controller.getposts.length,
                      itemBuilder: (context, index) {
                        var item = controller.getposts[index];
                        return Card(
                          child: ListTile(
                            title: Text(item.title),
                            subtitle: Text(item.body),
                            leading: Text(item.id.toString()),
                          ),
                        );
                      },
                    );
            }),
          ),
        ],
      ),
    );
  }
}
