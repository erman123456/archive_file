import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'app/routes/app_pages.dart';

Future<void> hiveInit() async {
  await Hive.openBox('archiveFiles');
}

Future<void> main() async {
  await hiveInit();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
