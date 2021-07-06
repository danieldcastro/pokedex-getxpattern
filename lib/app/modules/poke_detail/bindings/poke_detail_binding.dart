import 'package:get/get.dart';

import '../../../data/provider/poke_api_provider.dart';
import '../../../data/repository/poke_api_repository.dart';
import '../controllers/poke_detail_controller.dart';
import '../controllers/status_tab_controller.dart';

class PokeDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokeDetailController>(
      () => PokeDetailController(Get.find()),
    );
    Get.lazyPut<PokeApiRepository>(
        () => PokeApiRepository(pokeApiProvider: PokeApiProvider()));
    Get.lazyPut<StatusTabController>(
      () => StatusTabController(),
    );
  }
}
