import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/android/home/views/home_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/poke_detail/bindings/poke_detail_binding.dart';
import '../modules/poke_detail/views/poke_detail_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.POKE_DETAIL,
      page: () => PokeDetailView(),
      binding: PokeDetailBinding(),
    ),
  ];
}
