import 'package:get/get.dart';

import '../controllers/about_poke_controller.dart';

class AboutPokeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutPokeController>(
      () => AboutPokeController(),
    );
  }
}
