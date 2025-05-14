import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/archive-document');
              },
              child: const Text('Archive Document'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/archive-file');
              },
              child: const Text('Archive File'),
            ),
          ],
        ),
      ),
    );
  }
}
