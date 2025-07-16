import 'package:get/get.dart';

import '../modules/archive/bindings/archive_binding.dart';
import '../modules/archive/views/archive_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ARCHIVE,
      page: () => const ArchiveView(),
      binding: ArchiveBinding(),
    ),
    GetPage(
      name: _Paths.ARCHIVE_DOCUMENT,
      page: () => const ArchiveView(),
      binding: ArchiveBinding(),
    ),
    GetPage(
      name: _Paths.ARCHIVE_FILE,
      page: () => const ArchiveView(),
      binding: ArchiveBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
