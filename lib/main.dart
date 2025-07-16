import 'package:archive_file/app/constants/pref_key.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'app/routes/app_pages.dart';

Future<void> hiveInit() async {
  await Hive.initFlutter();
  await Hive.openBox(PrefKey.box);
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
