import 'package:get/get.dart';

import '../controllers/poke_detail_controller.dart';

class PokeDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokeDetailController>(
      () => PokeDetailController(),
    );
  }
}
