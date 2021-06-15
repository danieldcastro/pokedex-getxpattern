import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/android/home/bindings/home_binding.dart';
import '../modules/android/home/views/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
